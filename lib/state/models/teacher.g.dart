// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Teacher _$$_TeacherFromJson(Map<String, dynamic> json) => _$_Teacher(
      id: json['id'] as String,
      nuptk: json['nuptk'] as String,
      name: json['nama'] as String,
      gender: json['jenis_kelamin'] as String,
      address: json['alamat'] as String,
      birthDate: const StringDateTimeConverter()
          .fromJson(json['tanggal_lahir'] as String),
      birthPlace: json['tempat_lahir'] as String,
    );

Map<String, dynamic> _$$_TeacherToJson(_$_Teacher instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nuptk': instance.nuptk,
      'nama': instance.name,
      'jenis_kelamin': instance.gender,
      'alamat': instance.address,
      'tanggal_lahir':
          const StringDateTimeConverter().toJson(instance.birthDate),
      'tempat_lahir': instance.birthPlace,
    };
