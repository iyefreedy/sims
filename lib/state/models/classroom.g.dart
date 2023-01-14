// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'classroom.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Classroom _$$_ClassroomFromJson(Map<String, dynamic> json) => _$_Classroom(
      id: json['id'] as String,
      name: json['nama'] as String,
      year: json['tahun_ajaran'] as String,
      group: json['kelompok'] as String,
      teacherId: json['guru_id'] as String?,
      semester: json['semester'] as String,
      students: const ListStudentConverter().fromJson(json['siswa'] as List),
      attendances:
          const ListAttendanceConverter().fromJson(json['kehadiran'] as List),
    );

Map<String, dynamic> _$$_ClassroomToJson(_$_Classroom instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama': instance.name,
      'tahun_ajaran': instance.year,
      'kelompok': instance.group,
      'guru_id': instance.teacherId,
      'semester': instance.semester,
      'siswa': const ListStudentConverter().toJson(instance.students),
      'kehadiran': const ListAttendanceConverter().toJson(instance.attendances),
    };
