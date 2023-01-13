import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sims/state/auth/auth_service.dart';
import 'package:sims/state/auth/models/auth_state.dart';
import 'package:sims/state/auth/notifier/auth_state_notifier.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError(),
);

final authServiceProvider = Provider<AuthService>((ref) => AuthService());

final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return AuthStateNotifier(sharedPreferences);
});
