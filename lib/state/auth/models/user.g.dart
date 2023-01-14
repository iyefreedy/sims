// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      teacher: json['guru'] == null
          ? null
          : Teacher.fromJson(json['guru'] as Map<String, dynamic>),
      student: json['siswa'] == null
          ? null
          : Student.fromJson(json['siswa'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'role': _$RoleEnumMap[instance.role]!,
      'guru': instance.teacher?.toJson(),
      'siswa': instance.student?.toJson(),
    };

const _$RoleEnumMap = {
  Role.siswa: 'siswa',
  Role.guru: 'guru',
};
