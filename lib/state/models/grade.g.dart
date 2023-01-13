// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Grade _$$_GradeFromJson(Map<String, dynamic> json) => _$_Grade(
      id: json['id'] as String,
      student: Student.fromJson(json['siswa'] as Map<String, dynamic>),
      course: Course.fromJson(json['mata_pelajaran'] as Map<String, dynamic>),
      tugas: json['tugas'] as int,
      uts: json['uts'] as int,
      uas: json['uas'] as int,
      isPublished: json['is_published'] as bool,
    );

Map<String, dynamic> _$$_GradeToJson(_$_Grade instance) => <String, dynamic>{
      'id': instance.id,
      'siswa': instance.student.toJson(),
      'mata_pelajaran': instance.course.toJson(),
      'tugas': instance.tugas,
      'uts': instance.uts,
      'uas': instance.uas,
      'is_published': instance.isPublished,
    };
