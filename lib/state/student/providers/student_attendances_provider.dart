import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/student/student_service.dart';

final studentAttendanceProvider = FutureProvider.autoDispose(
  (ref) async {
    final service = ref.watch(studentServiceProvider);

    return await service.getAttendances();
  },
);
