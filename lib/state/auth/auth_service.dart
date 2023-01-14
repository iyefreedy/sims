import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:sims/state/auth/models/token.dart';
import 'package:http/http.dart' as http;
import 'package:sims/state/auth/models/user.dart';

class AuthService {
  const AuthService._();
  static const AuthService _instance = AuthService._();
  factory AuthService() => _instance;

  final baseUrl = 'http://192.168.100.8';
  final port = 8000;

  Future<bool> loginWithToken(Token token) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl:$port/api/user'),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );

      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      log('Login Response : $jsonResponse');
      log('Status Code : ${response.statusCode}');

      if (response.statusCode != 200) {
        return false;
      }

      return true;
    } on TimeoutException {
      rethrow;
    } on SocketException {
      rethrow;
    } on FormatException {
      rethrow;
    } on Exception {
      throw Exception('Terjadi kesalahan');
    }
  }

  Future<Token> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl:$port/api/login'),
        body: {
          'email': email,
          'password': password,
        },
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
        },
      );

      final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      log('Login Response : $jsonResponse');
      log('Status Code : ${response.statusCode}');

      if (response.statusCode != 200) {
        throw Exception(jsonResponse['message']);
      }

      return jsonResponse['token'] as Token;
    } on TimeoutException {
      rethrow;
    } on SocketException {
      rethrow;
    } on FormatException {
      rethrow;
    } on Exception {
      throw Exception('Terjadi kesalahan');
    }
  }

  Future<void> logout({
    required String token,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl:$port/api/logout'),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );

      log('Logout response : ${response.body}');
    } catch (e, s) {
      log('Error : $e');
      log('Staktracr : $s');
      throw Exception('Something went wrong');
    }
  }

  Future<User> getUser({
    required String token,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl:$port/api/user'),
        headers: {
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );

      final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
      log('$jsonBody');

      return User.fromJson(jsonBody['data']);
    } catch (e) {
      log('$e');
      throw Exception('$e');
    }
  }
}
