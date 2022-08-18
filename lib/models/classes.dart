import 'package:cloud_firestore/cloud_firestore.dart';

class Classes {
  final String id;
  final String classCode;
  final String schoolYear;

  Classes({
    required this.id,
    required this.classCode,
    required this.schoolYear,
  });

  Classes.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        classCode = snapshot.data()['kode_kelas'],
        schoolYear = snapshot.data()['tahun_ajaran'];
}
