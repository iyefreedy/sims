import 'package:sims/state/models/attendance.dart';

class TeacherMeetingArguments {
  final String classroomId;
  final List<Attendance> attendances;

  const TeacherMeetingArguments({
    required this.classroomId,
    required this.attendances,
  });

  @override
  String toString() {
    return '$runtimeType(scheduleId: $classroomId, attendances: $attendances)';
  }
}
