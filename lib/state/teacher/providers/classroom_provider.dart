import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/models/classroom.dart';
import 'package:sims/state/teacher/providers/teacher_service_provider.dart';
import 'package:sims/state/teacher/teacher_service.dart';

final classroomProvider = FutureProvider.autoDispose
    .family<Classroom, String>((ref, classroomId) async {
  final teacherService = ref.watch(teacherServiceProvider);
  final classroom = teacherService.getClassroom(classroomId);

  return classroom;
});
