// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      info: json['info'] as Object,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'role': _$RoleEnumMap[instance.role]!,
      'info': instance.info,
    };

const _$RoleEnumMap = {
  Role.siswa: 'siswa',
  Role.guru: 'guru',
};
