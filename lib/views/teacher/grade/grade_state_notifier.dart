import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/api_service.dart';
import 'package:sims/state/teacher/providers/teacher_service_provider.dart';
import 'package:sims/state/teacher/teacher_service.dart';
import 'package:sims/views/teacher/grade/grade_state.dart';

import '../../../arguments/teacher_grade_arguments.dart';

final gradeStateProvider = StateNotifierProvider.autoDispose
    .family<GradeStateNotifier, GradeState, TeacherGradeArguments>(
  (ref, args) {
    final service = ref.watch(apiServiceProvider);
    return GradeStateNotifier(service, args);
  },
);

class GradeStateNotifier extends StateNotifier<GradeState> {
  final ApiService service;
  final TeacherGradeArguments arguments;
  GradeStateNotifier(this.service, this.arguments) : super(GradeState.empty()) {
    loadData();
  }

  void loadData() async {
    state = state.copyWithIsLoading();
    final grades = await service.getGrades();

    state = GradeState(
      data: grades,
      isLoading: false,
    );
  }

  void saveData() async {
    state = state.copyWithIsLoading();
    final updateRequests = state.data.map((e) async {
      final grade = await service.updateGrade(e);
      return grade;
    });

    final grades = await Future.wait(updateRequests);

    state = GradeState(
      data: grades,
      isLoading: false,
    );
  }

  void updateUTSGrade(String id, int? value) {
    state = GradeState(
      data: [
        for (var grade in state.data)
          if (grade.id == id) grade.copyWith(uts: value ?? 0) else grade,
      ],
      isLoading: false,
    );
  }

  void updateTugasGrade(String id, int? value) {
    state = GradeState(
      data: [
        for (var grade in state.data)
          if (grade.id == id) grade.copyWith(tugas: value ?? 0) else grade,
      ],
      isLoading: false,
    );
  }

  void updateUASGrade(String id, int? value) {
    state = GradeState(
      data: [
        for (var grade in state.data)
          if (grade.id == id) grade.copyWith(uas: value ?? 0) else grade,
      ],
      isLoading: false,
    );
  }

  void updatePublished(String id) {
    state = GradeState(
      data: [
        for (var grade in state.data)
          if (grade.id == id)
            grade.copyWith(isPublished: !grade.isPublished)
          else
            grade,
      ],
      isLoading: false,
    );
  }

  void setPublish() {
    state = GradeState(
      data: [for (var grade in state.data) grade.copyWith(isPublished: true)],
      isLoading: false,
    );
  }

  void setUnpublish() {
    state = GradeState(
      data: [for (var grade in state.data) grade.copyWith(isPublished: false)],
      isLoading: false,
    );
  }
}
