import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sims/state/teacher/providers/student_list_provider.dart';
import 'package:sims/widgets/shimmer_loading_list.dart';

class StudentListScreen extends ConsumerWidget {
  const StudentListScreen({
    super.key,
    required this.classroomId,
  });

  final String classroomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studentListAsyncValue = ref.watch(studentListProvider(classroomId));
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Siswa'),
      ),
      body: studentListAsyncValue.when(
          data: (data) {
            final students = data.students;

            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return ExpansionTile(
                  title: Text(student.name),
                  subtitle: Text(student.nisn),
                  expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                  childrenPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  children: [
                    Row(
                      children: [
                        Text('Jenis Kelamin'),
                        Text(' : '),
                        Text(student.gender),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Tanggal Lahir'),
                        Text(' : '),
                        Text(
                            DateFormat('dd-MM-yyyy').format(student.birthDate)),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Alamat'),
                        Text(' : '),
                        Text(
                          student.address,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
          error: (error, s) => ErrorWidget(error),
          loading: () => const ShimmerLoadingList()),
    );
  }
}
