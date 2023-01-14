import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/app/routes.dart';
import 'package:sims/arguments/teacher_meeting_arguments.dart';
import 'package:sims/state/auth/provider/auth_user_provider.dart';
import 'package:sims/state/models/teacher.dart';
import 'package:sims/widgets/shimmer_loading_list.dart';

class ScheduleListScreen extends ConsumerWidget {
  const ScheduleListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValueUser = ref.watch(authUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Jadwal'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0).copyWith(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pilih Jadwal untuk melihat daftar kehadiran',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Expanded(
              child: asyncValueUser.when(
                data: (user) {
                  final teacher = user.teacher!;
                  // final filteredSchedules = [
                  //   for (var schedule in meetings)
                  //     if (schedule.teacher.id == teacher.id) schedule,
                  // ];
                  return ListView.separated(
                    itemCount: [].length,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemBuilder: (context, index) {
                      final meeting = [][index];
                      return ListTile(
                        title: Text(meeting.course.name),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {},
                      );
                    },
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
