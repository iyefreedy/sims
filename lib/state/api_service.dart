import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:sims/app/constants.dart';
import 'package:sims/state/auth/provider/auth_token_provider.dart';
import 'package:sims/state/models/attendance.dart';
import 'package:sims/state/models/classroom.dart';

import 'models/grade.dart';
import 'models/schedule.dart';

final apiServiceProvider = StateProvider<ApiService>((ref) {
  final token = ref.watch(authTokenProvider);

  return ApiService(token);
});

class ApiService {
  final String token;

  const ApiService(this.token);

  Future<List<Schedule>> getSchedules() async {
    final response = await http.get(
      Uri.parse('$kApiBaseUrl:$kPort/api/jadwal'),
      headers: {
        HttpHeaders.acceptHeader: 'application/vnd.api+json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    log(response.body);

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    return (jsonBody['data'] as List)
        .cast<Map<String, dynamic>>()
        .map((e) => Schedule.fromJson(e))
        .toList();
  }

  Future<List<Attendance>> getAttendances() async {
    final response = await http.get(
      Uri.parse('$kApiBaseUrl:$kPort/api/kehadiran'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
    log('$jsonBody');

    return (jsonBody['data'] as List)
        .cast<Map<String, dynamic>>()
        .map((e) => Attendance.fromJson(e))
        .toList();
  }

  Future<List<Attendance>> createAttendance({
    required String classroomId,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$kApiBaseUrl:$kPort/api/kehadiran'),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        body: {
          'kelas_id': classroomId,
        },
      );

      if (response.statusCode != 200) {
        final message =
            (jsonDecode(response.body) as Map<String, dynamic>)['message'];
        throw Exception(message);
      } else {
        final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
        return (jsonBody['data'] as List)
            .cast<Map<String, dynamic>>()
            .map((e) => Attendance.fromJson(e))
            .toList();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Attendance>> bacthUpdateAttendance(
      List<Attendance> attendances) async {
    final requests = attendances.map((e) async {
      final response = await http.put(
        Uri.parse('$kApiBaseUrl:$kPort/api/kehadiran/${e.id}'),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        body: {
          'keterangan': e.type?.name,
        },
      );

      log(response.body);

      final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

      return Attendance.fromJson(jsonBody['data'] as Map<String, dynamic>);
    });

    final updatedAttendances = await Future.wait(requests);

    return updatedAttendances;
  }

  Future<List<Grade>> getGrades() async {
    final uri = Uri.parse(
      '$kApiBaseUrl:$kPort/api/nilai',
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

  Future<Classroom> getClassroom(String classroomId) async {
    try {
      final response = await http.get(
        Uri.parse('$kApiBaseUrl:$kPort/api/kelas/$classroomId'),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );

      log(response.body);

      final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

      final classroomJson = jsonBody['data'] as Map<String, dynamic>;
      return Classroom.fromJson(classroomJson);
    } catch (e) {
      log('$e');

      throw Exception(e);
    }
  }

  Future<Grade> updateGrade(Grade grade) async {
    // try {
    final response = await http.put(
      Uri.parse('$kApiBaseUrl:$kPort/api/nilai/${grade.id}'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
      body: {
        'tugas': '${grade.tugas}',
        'uts': '${grade.uts}',
        'uas': '${grade.uas}',
        'is_published': '${grade.isPublished}',
      },
    );

    log(response.body);

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    final gradeJson = jsonBody['data'] as Map<String, dynamic>;
    return Grade.fromJson(gradeJson);
    // } catch (e) {
    //   log('$e');

    //   throw Exception(e);
    // }
  }
}
