import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/api_service.dart';
import 'package:sims/state/models/schedule.dart';
import 'package:sims/state/teacher/providers/teacher_service_provider.dart';

final schedulesProvider =
    FutureProvider.autoDispose<Iterable<Schedule>>((ref) async {
  final teacherService = ref.watch(apiServiceProvider);

  return await teacherService.getSchedules();
});
