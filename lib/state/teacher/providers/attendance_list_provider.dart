import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/teacher/providers/teacher_service_provider.dart';

import '../../models/attendance.dart';

final attendanceListProvider = FutureProvider.autoDispose
    .family<Iterable<Attendance>, String>((ref, meetingId) async {
  final teacherService = ref.watch(teacherServiceProvider);

  return await teacherService.getAttendanceByMeetingId(meetingId);
});
