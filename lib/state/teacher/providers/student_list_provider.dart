import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:sims/state/teacher/providers/teacher_service_provider.dart';

import '../../models/classroom.dart';

final studentListProvider =
    FutureProvider.autoDispose.family<Classroom, String>((ref, arg) {
  final teacherService = ref.watch(teacherServiceProvider);
  return teacherService.getClassroom(arg);
});
