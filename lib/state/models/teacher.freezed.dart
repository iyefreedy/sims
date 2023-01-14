// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'teacher.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Teacher _$TeacherFromJson(Map<String, dynamic> json) {
  return _Teacher.fromJson(json);
}

/// @nodoc
mixin _$Teacher {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'nuptk')
  String get nuptk => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'jenis_kelamin')
  String get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'alamat')
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'tanggal_lahir')
  @StringDateTimeConverter()
  DateTime get birthDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'tempat_lahir')
  String get birthPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'kelas_id')
  String? get classroomId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeacherCopyWith<Teacher> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherCopyWith<$Res> {
  factory $TeacherCopyWith(Teacher value, $Res Function(Teacher) then) =
      _$TeacherCopyWithImpl<$Res, Teacher>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'nuptk')
          String nuptk,
      @JsonKey(name: 'nama')
          String name,
      @JsonKey(name: 'jenis_kelamin')
          String gender,
      @JsonKey(name: 'alamat')
          String address,
      @JsonKey(name: 'tanggal_lahir')
      @StringDateTimeConverter()
          DateTime birthDate,
      @JsonKey(name: 'tempat_lahir')
          String birthPlace,
      @JsonKey(name: 'kelas_id')
          String? classroomId});
}

/// @nodoc
class _$TeacherCopyWithImpl<$Res, $Val extends Teacher>
    implements $TeacherCopyWith<$Res> {
  _$TeacherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nuptk = null,
    Object? name = null,
    Object? gender = null,
    Object? address = null,
    Object? birthDate = null,
    Object? birthPlace = null,
    Object? classroomId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nuptk: null == nuptk
          ? _value.nuptk
          : nuptk // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      birthPlace: null == birthPlace
          ? _value.birthPlace
          : birthPlace // ignore: cast_nullable_to_non_nullable
              as String,
      classroomId: freezed == classroomId
          ? _value.classroomId
          : classroomId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TeacherCopyWith<$Res> implements $TeacherCopyWith<$Res> {
  factory _$$_TeacherCopyWith(
          _$_Teacher value, $Res Function(_$_Teacher) then) =
      __$$_TeacherCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'nuptk')
          String nuptk,
      @JsonKey(name: 'nama')
          String name,
      @JsonKey(name: 'jenis_kelamin')
          String gender,
      @JsonKey(name: 'alamat')
          String address,
      @JsonKey(name: 'tanggal_lahir')
      @StringDateTimeConverter()
          DateTime birthDate,
      @JsonKey(name: 'tempat_lahir')
          String birthPlace,
      @JsonKey(name: 'kelas_id')
          String? classroomId});
}

/// @nodoc
class __$$_TeacherCopyWithImpl<$Res>
    extends _$TeacherCopyWithImpl<$Res, _$_Teacher>
    implements _$$_TeacherCopyWith<$Res> {
  __$$_TeacherCopyWithImpl(_$_Teacher _value, $Res Function(_$_Teacher) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nuptk = null,
    Object? name = null,
    Object? gender = null,
    Object? address = null,
    Object? birthDate = null,
    Object? birthPlace = null,
    Object? classroomId = freezed,
  }) {
    return _then(_$_Teacher(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nuptk: null == nuptk
          ? _value.nuptk
          : nuptk // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      birthPlace: null == birthPlace
          ? _value.birthPlace
          : birthPlace // ignore: cast_nullable_to_non_nullable
              as String,
      classroomId: freezed == classroomId
          ? _value.classroomId
          : classroomId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Teacher implements _Teacher {
  _$_Teacher(
      {required this.id,
      @JsonKey(name: 'nuptk')
          required this.nuptk,
      @JsonKey(name: 'nama')
          required this.name,
      @JsonKey(name: 'jenis_kelamin')
          required this.gender,
      @JsonKey(name: 'alamat')
          required this.address,
      @JsonKey(name: 'tanggal_lahir')
      @StringDateTimeConverter()
          required this.birthDate,
      @JsonKey(name: 'tempat_lahir')
          required this.birthPlace,
      @JsonKey(name: 'kelas_id')
          required this.classroomId});

  factory _$_Teacher.fromJson(Map<String, dynamic> json) =>
      _$$_TeacherFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'nuptk')
  final String nuptk;
  @override
  @JsonKey(name: 'nama')
  final String name;
  @override
  @JsonKey(name: 'jenis_kelamin')
  final String gender;
  @override
  @JsonKey(name: 'alamat')
  final String address;
  @override
  @JsonKey(name: 'tanggal_lahir')
  @StringDateTimeConverter()
  final DateTime birthDate;
  @override
  @JsonKey(name: 'tempat_lahir')
  final String birthPlace;
  @override
  @JsonKey(name: 'kelas_id')
  final String? classroomId;

  @override
  String toString() {
    return 'Teacher(id: $id, nuptk: $nuptk, name: $name, gender: $gender, address: $address, birthDate: $birthDate, birthPlace: $birthPlace, classroomId: $classroomId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Teacher &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nuptk, nuptk) || other.nuptk == nuptk) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.birthPlace, birthPlace) ||
                other.birthPlace == birthPlace) &&
            (identical(other.classroomId, classroomId) ||
                other.classroomId == classroomId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, nuptk, name, gender, address,
      birthDate, birthPlace, classroomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeacherCopyWith<_$_Teacher> get copyWith =>
      __$$_TeacherCopyWithImpl<_$_Teacher>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeacherToJson(
      this,
    );
  }
}

abstract class _Teacher implements Teacher {
  factory _Teacher(
      {required final String id,
      @JsonKey(name: 'nuptk')
          required final String nuptk,
      @JsonKey(name: 'nama')
          required final String name,
      @JsonKey(name: 'jenis_kelamin')
          required final String gender,
      @JsonKey(name: 'alamat')
          required final String address,
      @JsonKey(name: 'tanggal_lahir')
      @StringDateTimeConverter()
          required final DateTime birthDate,
      @JsonKey(name: 'tempat_lahir')
          required final String birthPlace,
      @JsonKey(name: 'kelas_id')
          required final String? classroomId}) = _$_Teacher;

  factory _Teacher.fromJson(Map<String, dynamic> json) = _$_Teacher.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'nuptk')
  String get nuptk;
  @override
  @JsonKey(name: 'nama')
  String get name;
  @override
  @JsonKey(name: 'jenis_kelamin')
  String get gender;
  @override
  @JsonKey(name: 'alamat')
  String get address;
  @override
  @JsonKey(name: 'tanggal_lahir')
  @StringDateTimeConverter()
  DateTime get birthDate;
  @override
  @JsonKey(name: 'tempat_lahir')
  String get birthPlace;
  @override
  @JsonKey(name: 'kelas_id')
  String? get classroomId;
  @override
  @JsonKey(ignore: true)
  _$$_TeacherCopyWith<_$_Teacher> get copyWith =>
      throw _privateConstructorUsedError;
}
