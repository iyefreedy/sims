// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return _Schedule.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'hari')
  int get day => throw _privateConstructorUsedError;
  @JsonKey(name: 'jam_mulai')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'jam_selesai')
  String get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'kelas')
  Classroom get classroom => throw _privateConstructorUsedError;
  @JsonKey(name: 'mata_pelajaran')
  Course get course => throw _privateConstructorUsedError;
  @JsonKey(name: 'guru')
  Teacher get teacher => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res, Schedule>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'hari') int day,
      @JsonKey(name: 'jam_mulai') String startTime,
      @JsonKey(name: 'jam_selesai') String endTime,
      @JsonKey(name: 'kelas') Classroom classroom,
      @JsonKey(name: 'mata_pelajaran') Course course,
      @JsonKey(name: 'guru') Teacher teacher});

  $ClassroomCopyWith<$Res> get classroom;
  $CourseCopyWith<$Res> get course;
  $TeacherCopyWith<$Res> get teacher;
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res, $Val extends Schedule>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? day = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? classroom = null,
    Object? course = null,
    Object? teacher = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      classroom: null == classroom
          ? _value.classroom
          : classroom // ignore: cast_nullable_to_non_nullable
              as Classroom,
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as Teacher,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClassroomCopyWith<$Res> get classroom {
    return $ClassroomCopyWith<$Res>(_value.classroom, (value) {
      return _then(_value.copyWith(classroom: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CourseCopyWith<$Res> get course {
    return $CourseCopyWith<$Res>(_value.course, (value) {
      return _then(_value.copyWith(course: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TeacherCopyWith<$Res> get teacher {
    return $TeacherCopyWith<$Res>(_value.teacher, (value) {
      return _then(_value.copyWith(teacher: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ScheduleCopyWith<$Res> implements $ScheduleCopyWith<$Res> {
  factory _$$_ScheduleCopyWith(
          _$_Schedule value, $Res Function(_$_Schedule) then) =
      __$$_ScheduleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'hari') int day,
      @JsonKey(name: 'jam_mulai') String startTime,
      @JsonKey(name: 'jam_selesai') String endTime,
      @JsonKey(name: 'kelas') Classroom classroom,
      @JsonKey(name: 'mata_pelajaran') Course course,
      @JsonKey(name: 'guru') Teacher teacher});

  @override
  $ClassroomCopyWith<$Res> get classroom;
  @override
  $CourseCopyWith<$Res> get course;
  @override
  $TeacherCopyWith<$Res> get teacher;
}

/// @nodoc
class __$$_ScheduleCopyWithImpl<$Res>
    extends _$ScheduleCopyWithImpl<$Res, _$_Schedule>
    implements _$$_ScheduleCopyWith<$Res> {
  __$$_ScheduleCopyWithImpl(
      _$_Schedule _value, $Res Function(_$_Schedule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? day = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? classroom = null,
    Object? course = null,
    Object? teacher = null,
  }) {
    return _then(_$_Schedule(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      classroom: null == classroom
          ? _value.classroom
          : classroom // ignore: cast_nullable_to_non_nullable
              as Classroom,
      course: null == course
          ? _value.course
          : course // ignore: cast_nullable_to_non_nullable
              as Course,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as Teacher,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Schedule implements _Schedule {
  const _$_Schedule(
      {required this.id,
      @JsonKey(name: 'hari') required this.day,
      @JsonKey(name: 'jam_mulai') required this.startTime,
      @JsonKey(name: 'jam_selesai') required this.endTime,
      @JsonKey(name: 'kelas') required this.classroom,
      @JsonKey(name: 'mata_pelajaran') required this.course,
      @JsonKey(name: 'guru') required this.teacher});

  factory _$_Schedule.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'hari')
  final int day;
  @override
  @JsonKey(name: 'jam_mulai')
  final String startTime;
  @override
  @JsonKey(name: 'jam_selesai')
  final String endTime;
  @override
  @JsonKey(name: 'kelas')
  final Classroom classroom;
  @override
  @JsonKey(name: 'mata_pelajaran')
  final Course course;
  @override
  @JsonKey(name: 'guru')
  final Teacher teacher;

  @override
  String toString() {
    return 'Schedule(id: $id, day: $day, startTime: $startTime, endTime: $endTime, classroom: $classroom, course: $course, teacher: $teacher)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Schedule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.classroom, classroom) ||
                other.classroom == classroom) &&
            (identical(other.course, course) || other.course == course) &&
            (identical(other.teacher, teacher) || other.teacher == teacher));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, day, startTime, endTime, classroom, course, teacher);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScheduleCopyWith<_$_Schedule> get copyWith =>
      __$$_ScheduleCopyWithImpl<_$_Schedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleToJson(
      this,
    );
  }
}

abstract class _Schedule implements Schedule {
  const factory _Schedule(
      {required final String id,
      @JsonKey(name: 'hari') required final int day,
      @JsonKey(name: 'jam_mulai') required final String startTime,
      @JsonKey(name: 'jam_selesai') required final String endTime,
      @JsonKey(name: 'kelas') required final Classroom classroom,
      @JsonKey(name: 'mata_pelajaran') required final Course course,
      @JsonKey(name: 'guru') required final Teacher teacher}) = _$_Schedule;

  factory _Schedule.fromJson(Map<String, dynamic> json) = _$_Schedule.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'hari')
  int get day;
  @override
  @JsonKey(name: 'jam_mulai')
  String get startTime;
  @override
  @JsonKey(name: 'jam_selesai')
  String get endTime;
  @override
  @JsonKey(name: 'kelas')
  Classroom get classroom;
  @override
  @JsonKey(name: 'mata_pelajaran')
  Course get course;
  @override
  @JsonKey(name: 'guru')
  Teacher get teacher;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleCopyWith<_$_Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}
