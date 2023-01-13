import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sims/enum/attendance_type.dart';
import 'package:sims/state/models/course.dart';
import 'package:sims/state/models/schedule.dart';
import 'package:sims/state/models/student.dart';
import 'package:sims/state/models/teacher.dart';
import 'package:sims/utilites/string_date_time_converter.dart';

part 'attendance.freezed.dart';
part 'attendance.g.dart';

@freezed
class Attendance with _$Attendance {
  @JsonSerializable(explicitToJson: true)
  const factory Attendance({
    required String id,
    @JsonKey(name: 'siswa') required Student student,
    @JsonKey(name: 'keterangan') required AttendanceType? type,
    @JsonKey(name: 'tanggal') @StringDateTimeConverter() required DateTime date,
    @JsonKey(name: 'kelas_id') required String classroomId,
    @JsonKey(name: 'mata_pelajaran_id') required String courseId,
  }) = _Attendance;

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);
}
