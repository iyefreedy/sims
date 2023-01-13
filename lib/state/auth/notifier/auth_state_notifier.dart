import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sims/state/auth/auth_service.dart';
import 'package:sims/state/auth/models/token.dart';

import '../models/auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(this.preferences)
      : super(AuthState(
          isLoading: true,
          token: null,
          error: null,
        )) {
    loginWithCurrentToken();
  }

  void loginWithCurrentToken() async {
    final token = preferences.getString('token');
    if (token == null) {
      state = AuthState(
        isLoading: false,
        token: null,
        error: null,
      );
    } else {
      final isSessionSaved = await _authService.loginWithToken(token);

      if (isSessionSaved) {
        state = AuthState(
          isLoading: false,
          token: token,
          error: null,
        );
      } else {
        state = AuthState(
          isLoading: false,
          token: null,
          error: null,
        );
      }
    }
  }

  void login({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true);
    try {
      final token = await _authService.login(email: email, password: password);
      final isTokenSaved = await preferences.setString('token', token);
      if (!isTokenSaved) {
        state = AuthState(
          isLoading: false,
          token: null,
          error: 'Gagal menyimpan session',
        );
      }

      state = AuthState(
        isLoading: false,
        token: token,
        error: null,
      );
    } on Exception catch (e) {
      state = AuthState(
        isLoading: false,
        token: null,
        error: '$e',
      );
    }
  }

  void logout() async {
    print('AuthStateNotifier : Logout');
    state = state.copyWith(isLoading: true);

    final token = preferences.getString('token');

    if (token != null) {
      print('Token not null and logout now');
      await _authService.logout(token: token);
      await preferences.remove('token');

      state = AuthState(
        isLoading: false,
        token: null,
        error: null,
      );
    } else {
      state = AuthState(
        isLoading: false,
        token: null,
        error: 'Terjadi kesalahan',
      );
    }
  }

  final SharedPreferences preferences;
  final AuthService _authService = AuthService();
}
