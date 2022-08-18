import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sims/enums/roles.dart';
import 'package:sims/models/auth_user.dart';
import 'package:sims/models/classes.dart';
import 'package:sims/models/cloud_user.dart';

class FirebaseCloudStorage {
  final student = FirebaseFirestore.instance.collection('siswa');
  final teacher = FirebaseFirestore.instance.collection('guru');
  final users = FirebaseFirestore.instance.collection('users');
  final homeroom = FirebaseFirestore.instance.collection('wali_murid');
  final classCollection = FirebaseFirestore.instance.collection('kelas');

  FirebaseCloudStorage._sharedInstance();

  static final FirebaseCloudStorage _shared =
      FirebaseCloudStorage._sharedInstance();
  factory FirebaseCloudStorage() => _shared;

  Future<CloudUser> getUser(String uid) async {
    try {
      final userDocument = await users.doc(uid).get();
      final role = userDocument.data()!['role'];
      final String uniqueNumber = userDocument.data()!['unique_number'];

      final user = await FirebaseFirestore.instance
          .collection(role)
          .doc(uniqueNumber)
          .get();
      return CloudUser.fromSnapshot(user);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> getUserRole(AuthUser user) async {
    final userDocument =
        await FirebaseFirestore.instance.collection('users').doc(user.id).get();
    final String role = userDocument.data()?['role'];

    return role;
  }

  Future<Iterable<CloudUser>> allStudents() async {
    final documents = await student.get();

    final allStudents = documents.docs.map((e) => CloudUser.fromSnapshot(e));

    return allStudents;
  }

  Stream<List<Classes>> allClasses() {
    final classes = classCollection.snapshots().map(
        (event) => event.docs.map((e) => Classes.fromSnapshot(e)).toList());

    return classes;
  }
}
