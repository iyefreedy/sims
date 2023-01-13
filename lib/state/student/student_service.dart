import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/auth/provider/auth_token_provider.dart';
import 'package:sims/state/models/attendance.dart';
import 'package:sims/state/models/schedule.dart';
import 'package:http/http.dart' as http;

final studentServiceProvider = StateProvider((ref) {
  final token = ref.watch(authTokenProvider);

  return StudentService(token);
});

class StudentService {
  final String token;

  const StudentService(this.token);

  final baseUrl = 'http://192.168.54.47';
  final port = 8000;

  Future<List<Schedule>> getSchedules() async {
    final response = await http.get(
      Uri.parse('$baseUrl:$port/api/jadwal'),
      headers: {
        HttpHeaders.acceptHeader: 'application/vnd.api+json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    return (jsonBody['data'] as List)
        .cast<Map<String, dynamic>>()
        .map((e) => Schedule.fromJson(e))
        .toList();
  }

  Future<List<Attendance>> getAttendances() async {
    final response = await http.get(
      Uri.parse('$baseUrl:$port/api/kehadiran'),
      headers: {
        HttpHeaders.acceptHeader: 'application/vnd.api+json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;

    return (jsonBody['data'] as List)
        .cast<Map<String, dynamic>>()
        .map((e) => Attendance.fromJson(e))
        .toList();
  }

  Future getCourses() async {
    final response = await http.get(
      Uri.parse('$baseUrl:$port/api/mata-pelajaran'),
      headers: {
        HttpHeaders.acceptHeader: 'application/vnd.api+json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      },
    );

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
    log('$jsonBody');

    return jsonBody['data'];
  }
}
