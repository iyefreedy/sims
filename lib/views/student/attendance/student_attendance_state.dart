import 'package:sims/state/models/attendance.dart';

class StudentAttedanceState {
  final List<Attendance> data;
  final bool isLoading;

  const StudentAttedanceState({
    required this.data,
    required this.isLoading,
  });

  factory StudentAttedanceState.empty() => const StudentAttedanceState(
        data: [],
        isLoading: false,
      );

  StudentAttedanceState copyWithIsLoading() =>
      StudentAttedanceState(data: data, isLoading: true);
}
