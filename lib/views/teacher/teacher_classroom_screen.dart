import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/arguments/teacher_grade_arguments.dart';
import 'package:sims/extensions/iterable_extensions.dart';
import 'package:sims/state/models/attendance.dart';
import 'package:sims/state/models/classroom.dart';
import 'package:sims/state/models/schedule.dart';
import 'package:sims/state/teacher/providers/teacher_schedule_list_provider.dart';

import '../../app/routes.dart';
import '../../enum/classroom_argument_type.dart';
import '../../widgets/shimmer_loading_list.dart';

class TeacherClassroomScreen extends ConsumerWidget {
  const TeacherClassroomScreen({
    super.key,
    required this.type,
  });

  final ClassroomType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedules = ref.watch(schedulesProvider);
    PreferredSizeWidget appBar;
    Widget body;

    switch (type) {
      case ClassroomType.attendance:
        appBar = AppBar(
          title: const Text('Daftar Kelas'),
        );
        body = Container(
          margin: const EdgeInsets.only(top: 8.0),
          height: MediaQuery.of(context).size.height,
          child: schedules.when(
            data: (data) {
              // final classrooms = data.map((e) => e.classroom).toSet().toList();
              final classrooms = data.groupBy((p0) => p0.classroom);
              return _ClassroomList(
                classrooms: classrooms,
                type: type,
              );
            },
            error: (error, stackTrace) => Center(
              child: Column(
                children: [
                  Text('$error'),
                  Text('$stackTrace'),
                ],
              ),
            ),
            loading: () => const ShimmerLoadingList(),
          ),
        );
        break;
      case ClassroomType.grade:
        appBar = AppBar(
          title: const Text('Menu Nilai'),
        );
        body = Container(
          margin: const EdgeInsets.only(top: 8.0),
          height: MediaQuery.of(context).size.height,
          child: schedules.when(
            data: (data) {
              // final classrooms = data.map((e) => e.classroom).toSet().toList();
              final classrooms = data.groupBy((p0) => p0.classroom);
              return _ClassroomList(
                classrooms: classrooms,
                type: type,
              );
            },
            error: (error, stackTrace) => Center(
              child: Column(
                children: [
                  Text('$error'),
                  Text('$stackTrace'),
                ],
              ),
            ),
            loading: () => const ShimmerLoadingList(),
          ),
        );
        break;
    }

    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}

class _ClassroomList extends StatelessWidget {
  const _ClassroomList({
    required this.classrooms,
    required this.type,
  });

  final Map<Classroom, List<Schedule>> classrooms;
  final ClassroomType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: classrooms.isEmpty
                ? Center(
                    child: Text(
                      'Belum ada data',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  )
                : ListView.builder(
                    itemCount: classrooms.length,
                    itemBuilder: (context, index) {
                      final entries = classrooms.entries.toList();
                      final map = entries[index];

                      return _ClassroomItem(
                        argumentType: type,
                        classroom: map.key,
                        schedules: map.value,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _ClassroomItem extends StatelessWidget {
  const _ClassroomItem({
    required this.classroom,
    required this.argumentType,
    required this.schedules,
  });

  final ClassroomType argumentType;
  final Classroom classroom;
  final List<Schedule> schedules;

  @override
  Widget build(BuildContext context) {
    final year = int.parse(classroom.year);

    return ListTile(
      onTap: () {
        switch (argumentType) {
          case ClassroomType.attendance:
            Navigator.of(context).pushNamed(
              teacherMeetingsRoute,
              arguments: classroom.id,
            );

            break;
          case ClassroomType.grade:
            Navigator.of(context).pushNamed(
              teacherGradeRoute,
              arguments: TeacherGradeArguments(
                classroomId: classroom.id,
                courseId: schedules.first.id,
              ),
            );
            break;
        }
      },
      title: Text('${classroom.name}-${classroom.group.toUpperCase()}'),
      subtitle: ListBody(
        children: [
          Text(schedules.first.course.name),
          Text(classroom.semester),
          Text('Tahun Ajaran : $year/${year + 1}'),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward),
    );
  }
}
