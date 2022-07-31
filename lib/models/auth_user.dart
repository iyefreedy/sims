import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  String id;
  bool isEmailVerified;

  AuthUser.fromFirebase(User user)
      : id = user.uid,
        isEmailVerified = user.emailVerified;

  AuthUser.fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        isEmailVerified = snapshot.data()['email_verified'];
}
