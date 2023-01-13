import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sims/enum/attendance_type.dart';
import 'package:sims/state/models/attendance.dart';
import 'package:sims/state/models/classroom.dart';
import 'package:sims/state/models/grade.dart';
import 'package:sims/state/models/schedule.dart';

class TeacherService {
  final String token;

  const TeacherService(this.token);

  final baseUrl = 'http://192.168.54.47';
  final port = 8000;

  Future<Iterable<Classroom>> getClassrooms() async {
    final response = await http.get(
      Uri.parse('$baseUrl:$port/api/kelas'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    log(response.body);

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    final classrooms =
        (jsonBody['data'] as List).map((e) => Classroom.fromJson(e));

    return classrooms;
  }

  Future<Classroom> getClassroom(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl:$port/api/kelas/$id'),
      headers: {
        HttpHeaders.acceptHeader: 'applcation/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );
    log(response.body);
    final jsonBody = jsonDecode(response.body);

    return Classroom.fromJson(jsonBody['data'] as Map<String, dynamic>);
  }

  Future<Iterable<Classroom>> getClassroomsBySchedule() async {
    final response = await http.get(
      Uri.parse('$baseUrl:$port/api/kelas'),
      headers: {
        HttpHeaders.acceptHeader: 'application/vnd.api+json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    log('$jsonBody');

    return (jsonBody['data'] as List)
        .cast<Map<String, dynamic>>()
        .map((e) => Classroom.fromJson(e));
  }

  Future<Iterable<Schedule>> getTeacherSchedules() async {
    final response = await http.get(
      Uri.parse('$baseUrl:$port/api/jadwal'),
      headers: {
        HttpHeaders.acceptHeader: 'application/vnd.api+json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    log(response.body);

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    return (jsonBody['data'] as List)
        .cast<Map<String, dynamic>>()
        .map((e) => Schedule.fromJson(e));
  }

  Future<void> createAttendance({
    required String classroomId,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl:$port/api/kehadiran'),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        body: {
          'kelas_id': classroomId,
        },
      );

      log(response.body);

      if (response.statusCode != 200) {
        final message =
            (jsonDecode(response.body) as Map<String, dynamic>)['message'];
        throw Exception(message);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Iterable<Attendance>> getAttendanceByMeetingId(
      String meetingId) async {
    final response = await http.get(
      Uri.parse('$baseUrl:$port/api/pertemuan/$meetingId'),
      headers: {
        HttpHeaders.acceptHeader: 'application/vnd.api+json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    final jsonBody = jsonDecode(response.body);
    log('$jsonBody');

    final meetings = jsonBody['data'] as Map<String, dynamic>;

    final attendances = (meetings['kehadiran'] as List)
        .cast<Map<String, dynamic>>()
        .map((e) => Attendance.fromJson(e));

    return attendances;
  }

  Future<void> updateAttendance(String id, AttendanceType? type) async {
    try {
      final response = await http
          .put(Uri.parse('$baseUrl:$port/api/kehadiran/$id'), headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      }, body: {
        'keterangan': type?.name,
      });
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<void> bacthUpdateAttendance(List<Attendance> attendances) async {
    final requests = attendances.map((e) async {
      return await http.put(
        Uri.parse('$baseUrl:$port/api/kehadiran/${e.id}'),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        body: {
          'keterangan': e.type?.name,
        },
      );
    });

    await Future.wait(requests);
  }

  Future<List<Grade>> fetchGradesByGradeArgument({
    required String classroomId,
    required String courseId,
  }) async {
    final uri = Uri.parse(
      '$baseUrl:$port/api/nilai?kelas_id=$classroomId&mata_pelajaran_id=$courseId',
    );
    final response = await http.get(
      uri,
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
    log('$jsonBody');

    final grades = (jsonBody['data'] as List)
        .cast<Map<String, dynamic>>()
        .map((e) => Grade.fromJson(e))
        .toList();

    return grades;
  }
}
