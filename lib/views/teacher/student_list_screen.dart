import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sims/app/routes.dart';
import 'package:sims/state/teacher/providers/student_list_provider.dart';
import 'package:sims/utilites/data_display.dart';
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
        title: const Text('Data Siswa'),
      ),
      body: studentListAsyncValue.when(
        data: (data) {
          final students = data.students;
          return SingleChildScrollView(
            child: PaginatedDataTable(
              header: Text('Kelas : ${data.name}-${data.group}'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      studentListReportRoute,
                      arguments: students,
                    );
                  },
                  child: const Icon(Icons.print),
                ),
              ],
              columns: const [
                DataColumn(label: Text('No.')),
                DataColumn(label: Text('NISN')),
                DataColumn(label: Text('Nama')),
                DataColumn(label: Text('Jenis Kelamin')),
              ],
              source: DataDisplay(students),
            ),
          );

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
                  Text(student.gender),
                  Text(DateFormat('dd-MMM-yyyy').format(student.birthDate)),
                  Text(
                    student.address,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
          );
        },
        error: (error, s) => ErrorWidget(error),
        loading: () => const ShimmerLoadingList(),
      ),
    );
  }
}
