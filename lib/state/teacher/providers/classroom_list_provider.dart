import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sims/state/models/classroom.dart';
import 'package:sims/state/teacher/providers/teacher_service_provider.dart';

final classroomListProvider =
    FutureProvider.autoDispose<Iterable<Classroom>>((ref) async {
  final teacherService = ref.watch(teacherServiceProvider);

  return await teacherService.getClassrooms();
});
