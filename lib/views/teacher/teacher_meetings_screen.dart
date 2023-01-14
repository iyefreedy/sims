import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sims/app/routes.dart';
import 'package:sims/arguments/teacher_attendance_arguments.dart';
import 'package:sims/arguments/teacher_meeting_arguments.dart';
import 'package:sims/extensions/iterable_extensions.dart';
import 'package:sims/state/api_service.dart';
import 'package:sims/state/models/attendance.dart';
import 'package:sims/state/providers/attendances_provider.dart';
import 'package:sims/widgets/shimmer_loading_list.dart';

final meetingScreenStateProvider = StateNotifierProvider.autoDispose<
    MeetingScreenStateNotifier, MeetingScreenState>((ref) {
  final service = ref.watch(apiServiceProvider);
  return MeetingScreenStateNotifier(service);
});

class MeetingScreenState {
  final List<Attendance> attendances;
  final bool isLoading;

  const MeetingScreenState({
    required this.attendances,
    required this.isLoading,
  });

  factory MeetingScreenState.empty() => const MeetingScreenState(
        attendances: [],
        isLoading: false,
      );

  MeetingScreenState copyWithLoading() => MeetingScreenState(
        attendances: attendances,
        isLoading: true,
      );

  Map<DateTime, List<Attendance>> getGroupedMeeting() {
    return attendances.groupBy<DateTime>((p0) => p0.date);
  }
}

class MeetingScreenStateNotifier extends StateNotifier<MeetingScreenState> {
  final ApiService service;
  MeetingScreenStateNotifier(this.service) : super(MeetingScreenState.empty()) {
    loadData();
  }

  void loadData() async {
    state = state.copyWithLoading();
    final attendaces = await service.getAttendances();

    state = MeetingScreenState(
      attendances: attendaces,
      isLoading: false,
    );
  }

  void createAttendanceMeet(String classroomId) async {
    state = state.copyWithLoading();
    final attendaces = await service.createAttendance(classroomId: classroomId);

    state = MeetingScreenState(
      attendances: attendaces,
      isLoading: false,
    );
  }
}

class TeacherMeetingsScreen extends ConsumerWidget {
  const TeacherMeetingsScreen({
    super.key,
    required this.classroomId,
  });

  final String classroomId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meetingsScreenState = ref.watch(meetingScreenStateProvider);
    final meetings = meetingsScreenState.attendances
        .where((e) => e.classroomId == classroomId)
        .groupBy((p0) => p0.date);

    final attendancesAsyncValue = ref.watch(attendancesProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Pertemuan')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  ref
                      .read(meetingScreenStateProvider.notifier)
                      .createAttendanceMeet(classroomId);
                },
                child: const Text('Buat Kehadiran'),
              ),
            ),
            Expanded(
              child: attendancesAsyncValue.when(
                data: (data) {
                  final groupedAttendances = data
                      .where((e) => e.classroomId == classroomId)
                      .groupBy((p0) => p0.date);

                  return groupedAttendances.isNotEmpty
                      ? ListView.builder(
                          itemCount: groupedAttendances.length,
                          itemBuilder: (context, index) {
                            final keys = groupedAttendances.keys.toList();
                            final title = keys[index];
                            return ListTile(
                              title: Text(
                                  'Pertemuan : ${DateFormat('dd-MM-yyyy').format(title)}'),
                              trailing: const Icon(Icons.chevron_right),
                              onTap: () {
                                log('${meetings[key]}');
                                Navigator.of(context).pushNamed(
                                  teacherAttendanceRoute,
                                  arguments: TeacherAttendanceArguments(
                                    clasroomId: classroomId,
                                    date: title,
                                  ),
                                );
                              },
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            'Belum ada data pertemuan',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        );
                },
                error: (error, stackTrace) => ErrorWidget(error),
                loading: () => const ShimmerLoadingList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
