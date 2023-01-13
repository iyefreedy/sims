// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Attendance _$$_AttendanceFromJson(Map<String, dynamic> json) =>
    _$_Attendance(
      id: json['id'] as String,
      student: Student.fromJson(json['siswa'] as Map<String, dynamic>),
      type: $enumDecodeNullable(_$AttendanceTypeEnumMap, json['keterangan']),
      date: const StringDateTimeConverter().fromJson(json['tanggal'] as String),
      classroomId: json['kelas_id'] as String,
      courseId: json['mata_pelajaran_id'] as String,
    );

Map<String, dynamic> _$$_AttendanceToJson(_$_Attendance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'siswa': instance.student.toJson(),
      'keterangan': _$AttendanceTypeEnumMap[instance.type],
      'tanggal': const StringDateTimeConverter().toJson(instance.date),
      'kelas_id': instance.classroomId,
      'mata_pelajaran_id': instance.courseId,
    };

const _$AttendanceTypeEnumMap = {
  AttendanceType.present: 'Hadir',
  AttendanceType.absent: 'Tanpa Keterangan',
  AttendanceType.sick: 'Sakit',
  AttendanceType.permit: 'Izin',
};
