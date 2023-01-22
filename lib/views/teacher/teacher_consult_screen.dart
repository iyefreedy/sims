import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/teacher/providers/classroom_provider.dart';
import 'package:sims/widgets/shimmer_loading_list.dart';

class TeacherConsultScreen extends ConsumerWidget {
  const TeacherConsultScreen({
    super.key,
    required this.classroomId,
  });

  final String classroomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final classroomAsyncValue = ref.watch(classroomProvider(classroomId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Konsultasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: classroomAsyncValue.when(
          data: (data) {
            final students = data.students;
            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return ListTile(
                  title: Text(student.name),
                );
              },
            );
          },
          error: (error, s) => ErrorWidget(error),
          loading: () => const ShimmerLoadingList(),
        ),
      ),
    );
  }
}
