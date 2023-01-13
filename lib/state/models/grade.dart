import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sims/state/models/course.dart';
import 'package:sims/state/models/student.dart';

part 'grade.freezed.dart';
part 'grade.g.dart';

@freezed
class Grade with _$Grade {
  @JsonSerializable(explicitToJson: true)
  const factory Grade({
    required String id,
    @JsonKey(name: 'siswa') required Student student,
    @JsonKey(name: 'mata_pelajaran') required Course course,
    required int tugas,
    required int uts,
    required int uas,
    @JsonKey(name: 'is_published') required bool isPublished,
  }) = _Grade;

  factory Grade.fromJson(Map<String, dynamic> json) => _$GradeFromJson(json);
}
