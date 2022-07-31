import 'package:firebase_auth/firebase_auth.dart';
import 'package:sims/models/auth_user.dart';
import 'package:sims/services/auth/auth_provider.dart';
import 'package:sims/services/auth/firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;
  const AuthService(this.provider);

  factory AuthService.firebase() => AuthService(FirebaseAuthProvider());
  @override
  Future<AuthUser> createUser({
    required String role,
    required String uniqueNumber,
    required String email,
    required String password,
  }) =>
      provider.createUser(
        role: role,
        uniqueNumber: uniqueNumber,
        email: email,
        password: password,
      );

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<void> initialize() => provider.initialize();

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(
        email: email,
        password: password,
      );

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();
  @override
  Future<void> sendPasswordReset({required String toEmail}) =>
      provider.sendEmailVerification();

  @override
  Future<IdTokenResult> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }
}
