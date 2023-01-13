import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:sims/state/teacher/providers/teacher_schedule_list_provider.dart';

import '../../utilites/dayname.dart';
import '../../widgets/shimmer_loading_list.dart';

class TeacherScheduleScreen extends ConsumerWidget {
  const TeacherScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedules = ref.watch(schedulesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Saya'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: schedules.when(
          data: (data) => GroupedListView(
            groupBy: (element) => element.day,
            groupSeparatorBuilder: (element) => Container(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                '${getDayName(element)}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            elements: data.toList(),
            itemBuilder: (context, schedule) => ExpansionTile(
              title: Text('${schedule.startTime}-${schedule.endTime}'),
              leading: CircleAvatar(
                child: Text(
                    '${schedule.classroom.name}-${schedule.classroom.group}'),
              ),
              expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
              childrenPadding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 6.0,
              ),
              children: [
                Text(schedule.course.name),
                Text(
                    'TA: ${schedule.classroom.semester} (${schedule.classroom.year})'),
              ],
            ),
          ),
          error: (error, stackTrace) => ListView(
            children: [
              Text('$error'),
              Text('$stackTrace'),
            ],
          ),
          loading: () => const ShimmerLoadingList(),
        ),
      ),
    );
  }
}
