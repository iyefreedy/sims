// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'attendance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Attendance _$AttendanceFromJson(Map<String, dynamic> json) {
  return _Attendance.fromJson(json);
}

/// @nodoc
mixin _$Attendance {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'siswa')
  Student get student => throw _privateConstructorUsedError;
  @JsonKey(name: 'keterangan')
  AttendanceType? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'tanggal')
  @StringDateTimeConverter()
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'kelas_id')
  String get classroomId => throw _privateConstructorUsedError;
  @JsonKey(name: 'mata_pelajaran_id')
  String get courseId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceCopyWith<Attendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceCopyWith<$Res> {
  factory $AttendanceCopyWith(
          Attendance value, $Res Function(Attendance) then) =
      _$AttendanceCopyWithImpl<$Res, Attendance>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'siswa') Student student,
      @JsonKey(name: 'keterangan') AttendanceType? type,
      @JsonKey(name: 'tanggal') @StringDateTimeConverter() DateTime date,
      @JsonKey(name: 'kelas_id') String classroomId,
      @JsonKey(name: 'mata_pelajaran_id') String courseId});

  $StudentCopyWith<$Res> get student;
}

/// @nodoc
class _$AttendanceCopyWithImpl<$Res, $Val extends Attendance>
    implements $AttendanceCopyWith<$Res> {
  _$AttendanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? student = null,
    Object? type = freezed,
    Object? date = null,
    Object? classroomId = null,
    Object? courseId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as Student,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AttendanceType?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      classroomId: null == classroomId
          ? _value.classroomId
          : classroomId // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StudentCopyWith<$Res> get student {
    return $StudentCopyWith<$Res>(_value.student, (value) {
      return _then(_value.copyWith(student: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AttendanceCopyWith<$Res>
    implements $AttendanceCopyWith<$Res> {
  factory _$$_AttendanceCopyWith(
          _$_Attendance value, $Res Function(_$_Attendance) then) =
      __$$_AttendanceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'siswa') Student student,
      @JsonKey(name: 'keterangan') AttendanceType? type,
      @JsonKey(name: 'tanggal') @StringDateTimeConverter() DateTime date,
      @JsonKey(name: 'kelas_id') String classroomId,
      @JsonKey(name: 'mata_pelajaran_id') String courseId});

  @override
  $StudentCopyWith<$Res> get student;
}

/// @nodoc
class __$$_AttendanceCopyWithImpl<$Res>
    extends _$AttendanceCopyWithImpl<$Res, _$_Attendance>
    implements _$$_AttendanceCopyWith<$Res> {
  __$$_AttendanceCopyWithImpl(
      _$_Attendance _value, $Res Function(_$_Attendance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? student = null,
    Object? type = freezed,
    Object? date = null,
    Object? classroomId = null,
    Object? courseId = null,
  }) {
    return _then(_$_Attendance(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as Student,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AttendanceType?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      classroomId: null == classroomId
          ? _value.classroomId
          : classroomId // ignore: cast_nullable_to_non_nullable
              as String,
      courseId: null == courseId
          ? _value.courseId
          : courseId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Attendance implements _Attendance {
  const _$_Attendance(
      {required this.id,
      @JsonKey(name: 'siswa') required this.student,
      @JsonKey(name: 'keterangan') required this.type,
      @JsonKey(name: 'tanggal') @StringDateTimeConverter() required this.date,
      @JsonKey(name: 'kelas_id') required this.classroomId,
      @JsonKey(name: 'mata_pelajaran_id') required this.courseId});

  factory _$_Attendance.fromJson(Map<String, dynamic> json) =>
      _$$_AttendanceFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'siswa')
  final Student student;
  @override
  @JsonKey(name: 'keterangan')
  final AttendanceType? type;
  @override
  @JsonKey(name: 'tanggal')
  @StringDateTimeConverter()
  final DateTime date;
  @override
  @JsonKey(name: 'kelas_id')
  final String classroomId;
  @override
  @JsonKey(name: 'mata_pelajaran_id')
  final String courseId;

  @override
  String toString() {
    return 'Attendance(id: $id, student: $student, type: $type, date: $date, classroomId: $classroomId, courseId: $courseId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Attendance &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.student, student) || other.student == student) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.classroomId, classroomId) ||
                other.classroomId == classroomId) &&
            (identical(other.courseId, courseId) ||
                other.courseId == courseId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, student, type, date, classroomId, courseId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AttendanceCopyWith<_$_Attendance> get copyWith =>
      __$$_AttendanceCopyWithImpl<_$_Attendance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttendanceToJson(
      this,
    );
  }
}

abstract class _Attendance implements Attendance {
  const factory _Attendance(
      {required final String id,
      @JsonKey(name: 'siswa')
          required final Student student,
      @JsonKey(name: 'keterangan')
          required final AttendanceType? type,
      @JsonKey(name: 'tanggal')
      @StringDateTimeConverter()
          required final DateTime date,
      @JsonKey(name: 'kelas_id')
          required final String classroomId,
      @JsonKey(name: 'mata_pelajaran_id')
          required final String courseId}) = _$_Attendance;

  factory _Attendance.fromJson(Map<String, dynamic> json) =
      _$_Attendance.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'siswa')
  Student get student;
  @override
  @JsonKey(name: 'keterangan')
  AttendanceType? get type;
  @override
  @JsonKey(name: 'tanggal')
  @StringDateTimeConverter()
  DateTime get date;
  @override
  @JsonKey(name: 'kelas_id')
  String get classroomId;
  @override
  @JsonKey(name: 'mata_pelajaran_id')
  String get courseId;
  @override
  @JsonKey(ignore: true)
  _$$_AttendanceCopyWith<_$_Attendance> get copyWith =>
      throw _privateConstructorUsedError;
}
