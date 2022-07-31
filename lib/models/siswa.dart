import 'package:cloud_firestore/cloud_firestore.dart';

class Siswa {
  String nis;
  String nama;
  String jenisKelamin;
  String tanggalLahir;
  String tempatLahir;

  Siswa.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : nis = snapshot.data()['nis'],
        nama = snapshot.data()['nama'],
        jenisKelamin = snapshot.data()['jenis_kelamin'],
        tanggalLahir = snapshot.data()['tanggal_lahir'],
        tempatLahir = snapshot.data()['tempat_lahir'];
}
