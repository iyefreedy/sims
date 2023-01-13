import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/providers/grade_list_provider.dart';
import 'package:sims/widgets/shimmer_loading_list.dart';

class StudentGradeScreen extends ConsumerWidget {
  const StudentGradeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gradeListAsyncValue = ref.watch(gradeListProvider);

    final body = gradeListAsyncValue.when(
      data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final grade = data[index];

            return ExpansionTile(
              expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
              childrenPadding: const EdgeInsets.symmetric(horizontal: 8.0),
              title: Text(grade.course.name),
              children: [
                Text('Tugas : ${grade.tugas}'),
                Text('UTS : ${grade.uts}'),
                Text('UAS : ${grade.uas}'),
              ],
            );
          },
        );
      },
      error: (error, stackTrace) => ErrorWidget(error),
      loading: () => const ShimmerLoadingList(),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nilai'),
      ),
      body: body,
    );
  }
}
