part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventInitialize extends AuthEvent {}

class AuthEventSendEmailVerification extends AuthEvent {}

class AuthEventLogin extends AuthEvent {
  final String email;
  final String password;
  const AuthEventLogin(this.email, this.password);
}

class AuthEventRegister extends AuthEvent {
  final String role;
  final String uniqueNumber;
  final String email;
  final String password;

  const AuthEventRegister({
    required this.role,
    required this.uniqueNumber,
    required this.email,
    required this.password,
  });
}

class AuthEventShouldRegister extends AuthEvent {
  final String role;
  const AuthEventShouldRegister(this.role);
}

class AuthEventForgotPassword extends AuthEvent {
  final String? email;
  const AuthEventForgotPassword({this.email});
}

class AuthEventLogOut extends AuthEvent {
  const AuthEventLogOut();
}
