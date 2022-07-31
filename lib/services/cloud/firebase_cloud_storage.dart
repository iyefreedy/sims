import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sims/enums/roles.dart';
import 'package:sims/models/cloud_user.dart';

class FirebaseCloudStorage {
  final student = FirebaseFirestore.instance.collection('siswa');
  final teacher = FirebaseFirestore.instance.collection('guru');

  FirebaseCloudStorage._sharedInstance();

  static final FirebaseCloudStorage _shared =
      FirebaseCloudStorage._sharedInstance();
  factory FirebaseCloudStorage() => _shared;

  Future<CloudUser> getUser(String uid) async {
    final userDocument =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final role = userDocument.data()!['role'];
    final uniqueNumber = userDocument.data()!['unique_number'];

    final collection = await FirebaseFirestore.instance
        .collection(role)
        .doc(uniqueNumber)
        .get();

    return CloudUser.fromSnapshot(collection);
  }

  Future<Roles> getUserRole(String uid) async {
    final userDocument =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final String role = userDocument.data()?['role'];

    if (role == 'siswa') {
      return Roles.student;
    } else {
      return Roles.teacher;
    }
  }
}
