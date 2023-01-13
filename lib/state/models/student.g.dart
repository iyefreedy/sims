// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Student _$$_StudentFromJson(Map<String, dynamic> json) => _$_Student(
      id: json['id'] as String,
      nisn: json['nisn'] as String,
      name: json['nama'] as String,
      gender: json['jenis_kelamin'] as String,
      address: json['alamat'] as String,
      birthPlace: json['tempat_lahir'] as String,
      birthDate: const StringDateTimeConverter()
          .fromJson(json['tanggal_lahir'] as String),
    );

Map<String, dynamic> _$$_StudentToJson(_$_Student instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nisn': instance.nisn,
      'nama': instance.name,
      'jenis_kelamin': instance.gender,
      'alamat': instance.address,
      'tempat_lahir': instance.birthPlace,
      'tanggal_lahir':
          const StringDateTimeConverter().toJson(instance.birthDate),
    };
