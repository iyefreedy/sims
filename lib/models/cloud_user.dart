import 'package:cloud_firestore/cloud_firestore.dart';

class CloudUser {
  final String id;
  final String name;
  final String gender;
  final Timestamp birthDate;
  final String birthPlace;

  CloudUser.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  )   : id = snapshot.id,
        name = snapshot.data()!['nama'],
        gender = snapshot.data()!['jenis_kelamin'],
        birthDate = snapshot.data()!['tanggal_lahir'],
        birthPlace = snapshot.data()!['tempat_lahir'];
}
