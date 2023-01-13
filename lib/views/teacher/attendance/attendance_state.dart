import 'package:sims/state/models/attendance.dart';

class AttendanceScreenState {
  final List<Attendance> attendances;
  final bool isLoading;

  const AttendanceScreenState({
    required this.attendances,
    required this.isLoading,
  });

  factory AttendanceScreenState.empty() => const AttendanceScreenState(
        attendances: [],
        isLoading: false,
      );

  AttendanceScreenState copyWithIsLoading() => AttendanceScreenState(
        attendances: attendances,
        isLoading: true,
      );
}
