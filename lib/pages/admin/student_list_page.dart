import 'package:flutter/material.dart';
import 'package:sims/models/cloud_user.dart';
import 'package:sims/services/cloud/firebase_cloud_storage.dart';

class StudentListPage extends StatefulWidget {
  const StudentListPage({Key? key}) : super(key: key);

  @override
  State<StudentListPage> createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Siswa'),
      ),
      body: FutureBuilder<Iterable<CloudUser>>(
        future: FirebaseCloudStorage().allStudents(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: Text('Tidak ada konektivitas'),
              );
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasData && snapshot.data != null) {
                final students = List<CloudUser>.from(snapshot.data!);

                return ListView.builder(
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(students[index].name),
                      subtitle: Text(students[index].id),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text('Belum ada data'),
                );
              }
          }
        },
      ),
    );
  }
}
