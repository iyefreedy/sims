import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/app/routes.dart';
import 'package:sims/arguments/student_attendance_arguments.dart';
import 'package:sims/state/student/providers/student_schedule_list_provider.dart';
import 'package:sims/widgets/shimmer_loading_list.dart';

class StudentCourseScreen extends ConsumerWidget {
  const StudentCourseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scheduleAsyncValue = ref.watch(studentScheduleListProvider);

    final body = scheduleAsyncValue.when(
      data: (data) {
        final courses = data.map((e) => e.course).toSet().toList();

        return ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            final course = courses[index];
            return ListTile(
              title: Text(course.name),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pushNamed(
                  studentAttendanceRoute,
                  arguments: StudentAttendanceArguments(courseId: course.id),
                );
              },
            );
          },
        );
      },
      error: (error, stackTrace) => ErrorWidget('$error'),
      loading: () => const ShimmerLoadingList(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kehadiran'),
      ),
      body: body,
    );
  }
}
