// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'student.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Student _$StudentFromJson(Map<String, dynamic> json) {
  return _Student.fromJson(json);
}

/// @nodoc
mixin _$Student {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'nisn')
  String get nisn => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'jenis_kelamin')
  String get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'alamat')
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'tempat_lahir')
  String get birthPlace => throw _privateConstructorUsedError;
  @JsonKey(name: 'tanggal_lahir')
  @StringDateTimeConverter()
  DateTime get birthDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudentCopyWith<Student> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentCopyWith<$Res> {
  factory $StudentCopyWith(Student value, $Res Function(Student) then) =
      _$StudentCopyWithImpl<$Res, Student>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'nisn')
          String nisn,
      @JsonKey(name: 'nama')
          String name,
      @JsonKey(name: 'jenis_kelamin')
          String gender,
      @JsonKey(name: 'alamat')
          String address,
      @JsonKey(name: 'tempat_lahir')
          String birthPlace,
      @JsonKey(name: 'tanggal_lahir')
      @StringDateTimeConverter()
          DateTime birthDate});
}

/// @nodoc
class _$StudentCopyWithImpl<$Res, $Val extends Student>
    implements $StudentCopyWith<$Res> {
  _$StudentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nisn = null,
    Object? name = null,
    Object? gender = null,
    Object? address = null,
    Object? birthPlace = null,
    Object? birthDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nisn: null == nisn
          ? _value.nisn
          : nisn // ignore: cast_nullable_to_non_nullable
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
      birthPlace: null == birthPlace
          ? _value.birthPlace
          : birthPlace // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StudentCopyWith<$Res> implements $StudentCopyWith<$Res> {
  factory _$$_StudentCopyWith(
          _$_Student value, $Res Function(_$_Student) then) =
      __$$_StudentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'nisn')
          String nisn,
      @JsonKey(name: 'nama')
          String name,
      @JsonKey(name: 'jenis_kelamin')
          String gender,
      @JsonKey(name: 'alamat')
          String address,
      @JsonKey(name: 'tempat_lahir')
          String birthPlace,
      @JsonKey(name: 'tanggal_lahir')
      @StringDateTimeConverter()
          DateTime birthDate});
}

/// @nodoc
class __$$_StudentCopyWithImpl<$Res>
    extends _$StudentCopyWithImpl<$Res, _$_Student>
    implements _$$_StudentCopyWith<$Res> {
  __$$_StudentCopyWithImpl(_$_Student _value, $Res Function(_$_Student) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nisn = null,
    Object? name = null,
    Object? gender = null,
    Object? address = null,
    Object? birthPlace = null,
    Object? birthDate = null,
  }) {
    return _then(_$_Student(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nisn: null == nisn
          ? _value.nisn
          : nisn // ignore: cast_nullable_to_non_nullable
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
      birthPlace: null == birthPlace
          ? _value.birthPlace
          : birthPlace // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: null == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Student implements _Student {
  _$_Student(
      {required this.id,
      @JsonKey(name: 'nisn')
          required this.nisn,
      @JsonKey(name: 'nama')
          required this.name,
      @JsonKey(name: 'jenis_kelamin')
          required this.gender,
      @JsonKey(name: 'alamat')
          required this.address,
      @JsonKey(name: 'tempat_lahir')
          required this.birthPlace,
      @JsonKey(name: 'tanggal_lahir')
      @StringDateTimeConverter()
          required this.birthDate});

  factory _$_Student.fromJson(Map<String, dynamic> json) =>
      _$$_StudentFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'nisn')
  final String nisn;
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
  @JsonKey(name: 'tempat_lahir')
  final String birthPlace;
  @override
  @JsonKey(name: 'tanggal_lahir')
  @StringDateTimeConverter()
  final DateTime birthDate;

  @override
  String toString() {
    return 'Student(id: $id, nisn: $nisn, name: $name, gender: $gender, address: $address, birthPlace: $birthPlace, birthDate: $birthDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Student &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nisn, nisn) || other.nisn == nisn) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.birthPlace, birthPlace) ||
                other.birthPlace == birthPlace) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, nisn, name, gender, address, birthPlace, birthDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StudentCopyWith<_$_Student> get copyWith =>
      __$$_StudentCopyWithImpl<_$_Student>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StudentToJson(
      this,
    );
  }
}

abstract class _Student implements Student {
  factory _Student(
      {required final String id,
      @JsonKey(name: 'nisn')
          required final String nisn,
      @JsonKey(name: 'nama')
          required final String name,
      @JsonKey(name: 'jenis_kelamin')
          required final String gender,
      @JsonKey(name: 'alamat')
          required final String address,
      @JsonKey(name: 'tempat_lahir')
          required final String birthPlace,
      @JsonKey(name: 'tanggal_lahir')
      @StringDateTimeConverter()
          required final DateTime birthDate}) = _$_Student;

  factory _Student.fromJson(Map<String, dynamic> json) = _$_Student.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'nisn')
  String get nisn;
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
  @JsonKey(name: 'tempat_lahir')
  String get birthPlace;
  @override
  @JsonKey(name: 'tanggal_lahir')
  @StringDateTimeConverter()
  DateTime get birthDate;
  @override
  @JsonKey(ignore: true)
  _$$_StudentCopyWith<_$_Student> get copyWith =>
      throw _privateConstructorUsedError;
}
