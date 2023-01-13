import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sims/app/routes.dart';
import 'package:sims/arguments/teacher_attendance_arguments.dart';
import 'package:sims/extensions/datetime_extensions.dart';
import 'package:sims/state/teacher/providers/attendance_list_provider.dart';
import 'package:sims/state/teacher/providers/attendance_notifier.dart';
import 'package:sims/state/teacher/providers/teacher_service_provider.dart';
import 'package:sims/utilites/dialogs/error_dialog.dart';
import 'package:sims/views/teacher/attendance/teacher_attendance_screen_controller.dart';
import 'package:sims/widgets/loading/loading_view.dart';
import 'package:sims/widgets/shimmer_loading_list.dart';

import '../../../enum/attendance_type.dart';
import '../../../state/models/attendance.dart';

class TeacherAttendanceScreen extends ConsumerWidget {
  const TeacherAttendanceScreen({
    super.key,
    required this.arguments,
  });

  final TeacherAttendanceArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceState = ref.watch(attendanceStateProvider);
    final attendances = attendanceState.attendances
        .where((element) => element.classroomId == arguments.clasroomId)
        .where((element) => element.date.isSameDate(arguments.date))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Kehadiran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    ref
                        .read(attendanceStateProvider.notifier)
                        .saveAttendances()
                        .then((_) =>
                            showErrorDialog(context, 'Data berhasil disimpan'));
                  },
                  child: const Text('Simpan'),
                ),
              ),
            ),
            Expanded(
              child: attendanceState.isLoading
                  ? const ShimmerLoadingList()
                  : ListView.builder(
                      itemCount: attendances.length,
                      itemBuilder: (context, index) {
                        var attendance = attendances[index];
                        return ExpansionTile(
                          title: Text(attendance.student.name),
                          children: [
                            for (var attendanceType in AttendanceType.values)
                              RadioListTile<AttendanceType>(
                                title: Text(attendanceType.name),
                                value: attendanceType,
                                groupValue: attendance.type,
                                onChanged: (value) {
                                  ref
                                      .read(attendanceStateProvider.notifier)
                                      .updateAttendance(attendance.id, value);
                                },
                              ),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceList(Iterable<Attendance> data) {
    final attendances = data.toList();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Simpan'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: attendances.length,
              itemBuilder: (context, index) {
                var attendance = attendances[index];
                return ExpansionTile(
                  title: Text(attendance.student.name),
                  children: [
                    for (var attendanceType in AttendanceType.values)
                      RadioListTile<AttendanceType>(
                        title: Text(attendanceType.name),
                        value: attendanceType,
                        groupValue: attendance.type,
                        onChanged: (value) {
                          // try {
                          //   ref
                          //       .read(
                          //           attendanceStateProvider(attendanceState).notifier)
                          //       .updateAttendanceType(attendance, value);
                          // } catch (e) {}
                        },
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
