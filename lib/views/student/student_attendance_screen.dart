import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sims/arguments/student_attendance_arguments.dart';
import 'package:sims/state/student/providers/student_attendances_provider.dart';
import 'package:sims/views/student/attendance/student_attendace_state_notifier.dart';
import 'package:sims/widgets/shimmer_loading_list.dart';

class StudentAttendanceScreen extends ConsumerWidget {
  const StudentAttendanceScreen({
    super.key,
    required this.arguments,
  });

  final StudentAttendanceArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attendanceState = ref.watch(studentAttendanceStateProvider);
    final attendances = attendanceState.data
        .where((e) => e.courseId == arguments.courseId)
        .toList();
    log('${attendanceState.data}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kehadiran'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Row(
            //   children: [
            //     DropdownButton(
            //       items: [],
            //       onChanged: (value) {},
            //     ),
            //   ],
            // ),
            DataTable(
              border: TableBorder.all(),
              columns: [
                for (var attendance in attendances)
                  DataColumn(
                    label:
                        Text(DateFormat('dd-MM-yyyy').format(attendance.date)),
                  ),
              ],
              rows: [
                for (var attendance in attendances)
                  DataRow(cells: [DataCell(Text('${attendance.type?.name}'))]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
