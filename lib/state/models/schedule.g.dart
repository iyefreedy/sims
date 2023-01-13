// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Schedule _$$_ScheduleFromJson(Map<String, dynamic> json) => _$_Schedule(
      id: json['id'] as String,
      day: json['hari'] as int,
      startTime: json['jam_mulai'] as String,
      endTime: json['jam_selesai'] as String,
      classroom: Classroom.fromJson(json['kelas'] as Map<String, dynamic>),
      course: Course.fromJson(json['mata_pelajaran'] as Map<String, dynamic>),
      teacher: Teacher.fromJson(json['guru'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ScheduleToJson(_$_Schedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hari': instance.day,
      'jam_mulai': instance.startTime,
      'jam_selesai': instance.endTime,
      'kelas': instance.classroom,
      'mata_pelajaran': instance.course,
      'guru': instance.teacher,
    };
