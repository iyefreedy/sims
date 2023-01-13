import '../../../state/models/grade.dart';

class GradeState {
  final List<Grade> data;
  final bool isLoading;

  const GradeState({
    required this.data,
    required this.isLoading,
  });

  factory GradeState.empty() => const GradeState(
        data: [],
        isLoading: false,
      );

  GradeState copyWithIsLoading() => GradeState(
        data: data,
        isLoading: true,
      );

  @override
  String toString() {
    return '$runtimeType(data: $data)';
  }
}
