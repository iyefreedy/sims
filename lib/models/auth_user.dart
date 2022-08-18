import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  String id;
  String email;
  bool isEmailVerified;

  AuthUser.fromFirebase(User user)
      : id = user.uid,
        email = user.email!,
        isEmailVerified = user.emailVerified;
}
