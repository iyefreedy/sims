import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/api_service.dart';
import 'package:sims/state/models/attendance.dart';

final attendancesProvider =
    FutureProvider.autoDispose<List<Attendance>>((ref) async {
  final service = ref.watch(apiServiceProvider);
  final attendances = await service.getAttendances();

  return attendances;
});
