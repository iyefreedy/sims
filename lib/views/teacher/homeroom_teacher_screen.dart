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
            title: const Text('Konsultasi'),
            leading: const Icon(Icons.chat),
            onTap: () {
              Navigator.of(context).pushNamed(
                teacherConsultRoute,
                arguments: classroomId,
              );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Data Siswa'),
            leading: const Icon(Icons.person_search),
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
