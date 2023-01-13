// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'grade.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Grade _$GradeFromJson(Map<String, dynamic> json) {
  return _Grade.fromJson(json);
}

/// @nodoc
mixin _$Grade {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'siswa')
  Student get student => throw _privateConstructorUsedError;
  @JsonKey(name: 'mata_pelajaran')
  Course get course => throw _privateConstructorUsedError;
  int get tugas => throw _privateConstructorUsedError;
  int get uts => throw _privateConstructorUsedError;
  int get uas => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_published')
  bool get isPublished => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GradeCopyWith<Grade> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GradeCopyWith<$Res> {
  factory $GradeCopyWith(Grade value, $Res Function(Grade) then) =
      _$GradeCopyWithImpl<$Res, Grade>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'siswa') Student student,
      @JsonKey(name: 'mata_pelajaran') Course course,
      int tugas,
      int uts,
      int uas,
      @JsonKey(name: 'is_published') bool isPublished});

  $StudentCopyWith<$Res> get student;
  $CourseCopyWith<$Res> get course;
}

/// @nodoc
class _$GradeCopyWithImpl<$Res, $Val extends Grade>
    implements $GradeCopyWith<$Res> {
  _$GradeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? student = null,
    Object? course = null,
    Object? tugas = null,
    Object? uts = null,
    Object? uas = null,
    Object? isPublished = null,
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
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course,
      tugas: null == tugas
          ? _value.tugas
          : tugas // ignore: cast_nullable_to_non_nullable
              as int,
      uts: null == uts
          ? _value.uts
          : uts // ignore: cast_nullable_to_non_nullable
              as int,
      uas: null == uas
          ? _value.uas
          : uas // ignore: cast_nullable_to_non_nullable
              as int,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StudentCopyWith<$Res> get student {
    return $StudentCopyWith<$Res>(_value.student, (value) {
      return _then(_value.copyWith(student: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res> get course {
    return $CourseCopyWith<$Res>(_value.course, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GradeCopyWith<$Res> implements $GradeCopyWith<$Res> {
  factory _$$_GradeCopyWith(_$_Grade value, $Res Function(_$_Grade) then) =
      __$$_GradeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'siswa') Student student,
      @JsonKey(name: 'mata_pelajaran') Course course,
      int tugas,
      int uts,
      int uas,
      @JsonKey(name: 'is_published') bool isPublished});

  @override
  $StudentCopyWith<$Res> get student;
  @override
  $CourseCopyWith<$Res> get course;
}

/// @nodoc
class __$$_GradeCopyWithImpl<$Res> extends _$GradeCopyWithImpl<$Res, _$_Grade>
    implements _$$_GradeCopyWith<$Res> {
  __$$_GradeCopyWithImpl(_$_Grade _value, $Res Function(_$_Grade) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? student = null,
    Object? course = null,
    Object? tugas = null,
    Object? uts = null,
    Object? uas = null,
    Object? isPublished = null,
  }) {
    return _then(_$_Grade(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      student: null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as Student,
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course,
      tugas: null == tugas
          ? _value.tugas
          : tugas // ignore: cast_nullable_to_non_nullable
              as int,
      uts: null == uts
          ? _value.uts
          : uts // ignore: cast_nullable_to_non_nullable
              as int,
      uas: null == uas
          ? _value.uas
          : uas // ignore: cast_nullable_to_non_nullable
              as int,
      isPublished: null == isPublished
          ? _value.isPublished
          : isPublished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Grade implements _Grade {
  const _$_Grade(
      {required this.id,
      @JsonKey(name: 'siswa') required this.student,
      @JsonKey(name: 'mata_pelajaran') required this.course,
      required this.tugas,
      required this.uts,
      required this.uas,
      @JsonKey(name: 'is_published') required this.isPublished});

  factory _$_Grade.fromJson(Map<String, dynamic> json) =>
      _$$_GradeFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'siswa')
  final Student student;
  @override
  @JsonKey(name: 'mata_pelajaran')
  final Course course;
  @override
  final int tugas;
  @override
  final int uts;
  @override
  final int uas;
  @override
  @JsonKey(name: 'is_published')
  final bool isPublished;

  @override
  String toString() {
    return 'Grade(id: $id, student: $student, course: $course, tugas: $tugas, uts: $uts, uas: $uas, isPublished: $isPublished)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Grade &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.student, student) || other.student == student) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.tugas, tugas) || other.tugas == tugas) &&
            (identical(other.uts, uts) || other.uts == uts) &&
            (identical(other.uas, uas) || other.uas == uas) &&
            (identical(other.isPublished, isPublished) ||
                other.isPublished == isPublished));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, student, course, tugas, uts, uas, isPublished);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GradeCopyWith<_$_Grade> get copyWith =>
      __$$_GradeCopyWithImpl<_$_Grade>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GradeToJson(
      this,
    );
  }
}

abstract class _Grade implements Grade {
  const factory _Grade(
          {required final String id,
          @JsonKey(name: 'siswa') required final Student student,
          @JsonKey(name: 'mata_pelajaran') required final Course course,
          required final int tugas,
          required final int uts,
          required final int uas,
          @JsonKey(name: 'is_published') required final bool isPublished}) =
      _$_Grade;

  factory _Grade.fromJson(Map<String, dynamic> json) = _$_Grade.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'siswa')
  Student get student;
  @override
  @JsonKey(name: 'mata_pelajaran')
  Course get course;
  @override
  int get tugas;
  @override
  int get uts;
  @override
  int get uas;
  @override
  @JsonKey(name: 'is_published')
  bool get isPublished;
  @override
  @JsonKey(ignore: true)
  _$$_GradeCopyWith<_$_Grade> get copyWith =>
      throw _privateConstructorUsedError;
}
