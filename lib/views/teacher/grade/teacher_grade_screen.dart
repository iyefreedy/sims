import 'dart:developer' as dev;
import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/arguments/teacher_grade_arguments.dart';
import 'package:sims/state/teacher/providers/classroom_provider.dart';
import 'package:sims/state/teacher/providers/grade_list_provider.dart';
import 'package:sims/test.dart';
import 'package:sims/utilites/dialogs/input_grade_dialog.dart';
import 'package:sims/views/teacher/grade/grade_state_notifier.dart';
import 'package:sims/widgets/shimmer_loading_list.dart';

import '../../../state/models/grade.dart';

class TeacherGradeScreen extends ConsumerWidget {
  const TeacherGradeScreen({
    super.key,
    required this.arguments,
  });

  final TeacherGradeArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gradeState = ref.watch(gradeStateProvider(arguments));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Nilai Siswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Publish Nilai'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Simpan Nilai'),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Expanded(
              child: gradeState.isLoading
                  ? const ShimmerLoadingList()
                  : buildStudentsList(gradeState.data, context, ref),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStudentsList(
    List<Grade> data,
    BuildContext context,
    WidgetRef ref,
  ) {
    var grades = data;
    final dataColumns = [
      DataColumn(
        label: const Expanded(child: Text('Nama')),
        onSort: (columnIndex, ascending) {},
      ),
      DataColumn(
        label: const Text('Tugas'),
        onSort: (columnIndex, ascending) {},
      ),
      DataColumn(
        label: const Text('UTS'),
        onSort: (columnIndex, ascending) {},
      ),
      DataColumn(
        label: const Text('UAS'),
        onSort: (columnIndex, ascending) {},
      ),
      DataColumn(
        label: Row(
          children: [
            const Text('Publish Nilai'),
            IconButton(
                onPressed: () {
                  final publishedGrade =
                      grades.where((element) => element.isPublished == true);
                  final unpublishedGrade =
                      grades.where((element) => element.isPublished == false);
                  final isThereOnPublished =
                      grades.every((element) => element.isPublished);

                  dev.log('$isThereOnPublished');

                  if (publishedGrade.length > unpublishedGrade.length) {
                    ref
                        .watch(gradeStateProvider(arguments).notifier)
                        .setUnpublish();
                  } else {
                    ref
                        .watch(gradeStateProvider(arguments).notifier)
                        .setPublish();
                  }
                },
                icon: Icon(
                  Icons.check_box,
                  color: grades.every((element) => element.isPublished)
                      ? Colors.blue
                      : Colors.grey,
                )),
          ],
        ),
        onSort: (columnIndex, ascending) {},
      ),
    ];

    final dataRows = [
      for (var grade in grades)
        DataRow(
          cells: [
            DataCell(Text(grade.student.name)),
            DataCell(
              Text(grade.tugas.toString()),
              showEditIcon: true,
              onTap: () async {
                final textController = TextEditingController();
                final controller =
                    await showInputGradeDialog(context, textController);

                ref
                    .watch(gradeStateProvider(arguments).notifier)
                    .updateTugasGrade(
                        grade.id, int.tryParse('${controller?.text}'));
              },
            ),
            DataCell(
              Text(grade.uts.toString()),
              showEditIcon: true,
              onTap: () async {
                final textController = TextEditingController();
                final controller =
                    await showInputGradeDialog(context, textController);

                ref
                    .watch(gradeStateProvider(arguments).notifier)
                    .updateUTSGrade(
                        grade.id, int.tryParse('${controller?.text}'));
              },
            ),
            DataCell(
              Text(grade.uas.toString()),
              showEditIcon: true,
              onTap: () async {
                final textController = TextEditingController();
                final controller =
                    await showInputGradeDialog(context, textController);

                ref
                    .watch(gradeStateProvider(arguments).notifier)
                    .updateUASGrade(
                        grade.id, int.tryParse('${controller?.text}'));
              },
            ),
            DataCell(
              Checkbox(
                value: grade.isPublished,
                onChanged: (value) {
                  ref
                      .watch(gradeStateProvider(arguments).notifier)
                      .updatePublished(grade.id);
                },
              ),
            ),
          ],
        )
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          columns: dataColumns,
          rows: dataRows,
        ),
      ),
    );
  }
}
