import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sims/utilites/string_date_time_converter.dart';

part 'teacher.freezed.dart';
part 'teacher.g.dart';

@freezed
class Teacher with _$Teacher {
  factory Teacher({
    required String id,
    @JsonKey(name: 'nuptk') required String nuptk,
    @JsonKey(name: 'nama') required String name,
    @JsonKey(name: 'jenis_kelamin') required String gender,
    @JsonKey(name: 'alamat') required String address,
    @JsonKey(name: 'tanggal_lahir')
    @StringDateTimeConverter()
        required DateTime birthDate,
    @JsonKey(name: 'tempat_lahir') required String birthPlace,
  }) = _Teacher;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);
}
