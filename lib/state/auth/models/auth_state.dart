import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sims/state/auth/models/token.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    required bool isLoading,
    required Token? token,
    required String? error,
  }) = _AuthState;
}
