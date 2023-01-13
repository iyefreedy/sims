// import 'dart:developer';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sims/enum/attendance_type.dart';
// import 'package:sims/state/models/attendance.dart';

// class AttendanceNotifier extends StateNotifier<Iterable<Attendance>> {
//   final Iterable<Attendance>? attendances;
//   AttendanceNotifier(this.attendances) : super(attendances ?? []);

//   void updateAttendanceType(String id, AttendanceType? value) {
//     for (final attendance in state) {
//       if (attendance.id == id) {
//         log('Before : ${attendance.type}');
//       }
//     }
//     state = [
//       for (var attendance in state)
//         // we're marking only the matching todo as completed
//         if (attendance.id == id)
//           // Once more, since our state is immutable, we need to make a copy
//           // of the todo. We're using our `copyWith` method implemented before
//           // to help with that.
//           attendance.copyWith(type: value)
//         else
//           // other todos are not modified
//           attendance,
//     ];

//     for (final attendance in state) {
//       if (attendance.id == id) {
//         log('After : ${attendance.type}');
//       }
//     }
//   }
// }

// final attendanceStateProvider = StateNotifierProvider.autoDispose
//     .family<AttendanceNotifier, Iterable<Attendance>, Iterable<Attendance>?>(
//   (ref, args) => AttendanceNotifier(args),
// );
