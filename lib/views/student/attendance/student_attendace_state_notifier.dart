import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/api_service.dart';
import 'package:sims/state/student/student_service.dart';
import 'package:sims/views/student/attendance/student_attendance_state.dart';

final studentAttendanceStateProvider = StateNotifierProvider.autoDispose<
    StudentAttendanceStateNotifier, StudentAttedanceState>((ref) {
  final service = ref.watch(apiServiceProvider);

  return StudentAttendanceStateNotifier(service);
});

class StudentAttendanceStateNotifier
    extends StateNotifier<StudentAttedanceState> {
  final ApiService service;
  StudentAttendanceStateNotifier(this.service)
      : super(StudentAttedanceState.empty()) {
    loadData();
  }

  void loadData() async {
    state = state.copyWithIsLoading();
    final attendances = await service.getAttendances();

    state = StudentAttedanceState(
      data: attendances,
      isLoading: false,
    );
  }

  void filterAttendances() {
    state = StudentAttedanceState(
      data: [
        for (var attendance in state.data) attendance,
      ],
      isLoading: false,
    );
  }
}
