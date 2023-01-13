import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/app/routes.dart';
import 'package:sims/arguments/teacher_grade_arguments.dart';
import 'package:sims/state/models/classroom.dart';
import 'package:sims/widgets/shimmer_loading_list.dart';

import '../../state/auth/provider/auth_user_provider.dart';
import '../../state/models/teacher.dart';

class CourseListScreen extends ConsumerWidget {
  const CourseListScreen({
    super.key,
    required this.classroom,
  });

  final Classroom classroom;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValueUser = ref.watch(authUserProvider);

    // return Scaffold();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Mata Pelajaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0).copyWith(top: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Pilih Mata Pelajaran'),
            Expanded(
              child: asyncValueUser.when(
                data: (user) {
                  final userInfo = user.info as Map<String, dynamic>;
                  final teacher = Teacher.fromJson(userInfo);
                  final filteredCourses = [
                    for (var schedule in classroom.students) schedule
                  ];

                  final uniqueCourse =
                      filteredCourses.map((e) => e).toSet().toList();

                  return ListView.separated(
                    itemCount: uniqueCourse.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final course = uniqueCourse[index];
                      return ListTile(
                        title: Text(course.name),
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            teacherGradeRoute,
                            arguments: TeacherGradeArguments(
                              classroomId: classroom.id,
                              courseId: course.id,
                            ),
                          );
                        },
                      );
                    },
                  );
                },
                error: (error, stackTrace) => ErrorWidget(error),
                loading: () => const ShimmerLoadingList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
