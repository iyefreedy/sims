import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/app/routes.dart';

class HomeroomTeacherScreen extends ConsumerWidget {
  const HomeroomTeacherScreen({
    super.key,
    required this.classroomId,
  });

  final String classroomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Wali Kelas'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Konsultasi'),
            leading: Icon(Icons.chat),
          ),
          Divider(),
          ListTile(
            title: Text('Data Siswa'),
            leading: Icon(Icons.person_search),
            onTap: () {
              Navigator.of(context).pushNamed(
                studentListRoute,
                arguments: classroomId,
              );
            },
          ),
        ],
      ),
    );
  }
}
