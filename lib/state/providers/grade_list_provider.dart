import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/api_service.dart';
import 'package:sims/state/models/grade.dart';

final gradeListProvider = FutureProvider.autoDispose<List<Grade>>((ref) async {
  final service = ref.watch(apiServiceProvider);

  final grades = await service.getGrades();

  return grades;
});
