import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sims/utilites/string_date_time_converter.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
class Student with _$Student {
  @JsonSerializable(explicitToJson: true)
  factory Student({
    required String id,
    @JsonKey(name: 'nisn') required String nisn,
    @JsonKey(name: 'nama') required String name,
    @JsonKey(name: 'jenis_kelamin') required String gender,
    @JsonKey(name: 'alamat') required String address,
    @JsonKey(name: 'tempat_lahir') required String birthPlace,
    @JsonKey(name: 'tanggal_lahir')
    @StringDateTimeConverter()
        required DateTime birthDate,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);
}
