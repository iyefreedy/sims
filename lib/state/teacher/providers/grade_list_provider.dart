import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/arguments/teacher_grade_arguments.dart';
import 'package:sims/state/models/grade.dart';
import 'package:sims/state/teacher/providers/teacher_service_provider.dart';

final gradeListProvider =
    FutureProvider.autoDispose.family<List<Grade>, TeacherGradeArguments>(
  (ref, args) async {
    final service = ref.watch(teacherServiceProvider);
    final classroomId = args.classroomId;
    final courseId = args.courseId;

    return await service.fetchGradesByGradeArgument(
      classroomId: classroomId,
      courseId: courseId,
    );
  },
);
