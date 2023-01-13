import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/enum/attendance_type.dart';
import 'package:sims/state/api_service.dart';
import 'package:sims/views/teacher/attendance/attendance_state.dart';

import '../../../state/models/attendance.dart';

final attendanceStateProvider = StateNotifierProvider.autoDispose<
    AttendanceScreenController, AttendanceScreenState>(
  (ref) {
    final service = ref.watch(apiServiceProvider);

    return AttendanceScreenController(service);
  },
);

class AttendanceScreenController extends StateNotifier<AttendanceScreenState> {
  final ApiService service;
  AttendanceScreenController(this.service)
      : super(AttendanceScreenState.empty()) {
    loadData();
  }

  void loadData() async {
    state = state.copyWithIsLoading();
    final attendances = await service.getAttendances();

    state = AttendanceScreenState(attendances: attendances, isLoading: false);
  }

  void updateAttendance(String id, AttendanceType? value) async {
    state = AttendanceScreenState(
      attendances: [
        for (var attendance in state.attendances)
          if (attendance.id == id)
            attendance.copyWith(type: value)
          else
            attendance,
      ],
      isLoading: false,
    );
  }

  Future<void> saveAttendances() async {
    state = state.copyWithIsLoading();
    final attendances = await service.bacthUpdateAttendance(state.attendances);

    state = AttendanceScreenState(
      attendances: attendances,
      isLoading: false,
    );
  }
}
