import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sims/converter/list_attendance_converter.dart';
import 'package:sims/converter/list_student_converter.dart';

import 'attendance.dart';
import 'student.dart';

part 'classroom.freezed.dart';
part 'classroom.g.dart';

@freezed
class Classroom with _$Classroom {
  @JsonSerializable(explicitToJson: true)
  const factory Classroom({
    required String id,
    @JsonKey(name: 'nama') required String name,
    @JsonKey(name: 'tahun_ajaran') required String year,
    @JsonKey(name: 'kelompok') required String group,
    @JsonKey(name: 'guru_id') required String? teacherId,
    required String semester,
    @JsonKey(name: 'siswa')
    @ListStudentConverter()
        required List<Student> students,
    @JsonKey(name: 'kehadiran')
    @ListAttendanceConverter()
        required List<Attendance> attendances,
  }) = _Classroom;

  factory Classroom.fromJson(Map<String, dynamic> json) =>
      _$ClassroomFromJson(json);
}
