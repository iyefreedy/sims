import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
class Course with _$Course {
  @JsonSerializable(explicitToJson: true)
  factory Course({
    required String id,
    @JsonKey(name: 'nama_mata_pelajaran') required String name,
    @JsonKey(name: 'kode_mata_pelajaran') required String code,
    // required int kkm,
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}
