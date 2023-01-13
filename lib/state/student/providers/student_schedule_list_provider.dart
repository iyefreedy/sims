import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/api_service.dart';
import 'package:sims/state/student/student_service.dart';

final studentScheduleListProvider = FutureProvider.autoDispose((ref) async {
  final teacherService = ref.watch(apiServiceProvider);

  return await teacherService.getSchedules();
});
