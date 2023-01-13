// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'classroom.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Classroom _$ClassroomFromJson(Map<String, dynamic> json) {
  return _Classroom.fromJson(json);
}

/// @nodoc
mixin _$Classroom {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'tahun_ajaran')
  String get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'kelompok')
  String get group => throw _privateConstructorUsedError;
  String get semester => throw _privateConstructorUsedError;
  @JsonKey(name: 'siswa')
  @ListStudentConverter()
  List<Student> get students => throw _privateConstructorUsedError;
  @JsonKey(name: 'kehadiran')
  @ListAttendanceConverter()
  List<Attendance> get attendances => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassroomCopyWith<Classroom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassroomCopyWith<$Res> {
  factory $ClassroomCopyWith(Classroom value, $Res Function(Classroom) then) =
      _$ClassroomCopyWithImpl<$Res, Classroom>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'nama')
          String name,
      @JsonKey(name: 'tahun_ajaran')
          String year,
      @JsonKey(name: 'kelompok')
          String group,
      String semester,
      @JsonKey(name: 'siswa')
      @ListStudentConverter()
          List<Student> students,
      @JsonKey(name: 'kehadiran')
      @ListAttendanceConverter()
          List<Attendance> attendances});
}

/// @nodoc
class _$ClassroomCopyWithImpl<$Res, $Val extends Classroom>
    implements $ClassroomCopyWith<$Res> {
  _$ClassroomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? year = null,
    Object? group = null,
    Object? semester = null,
    Object? students = null,
    Object? attendances = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      students: null == students
          ? _value.students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Student>,
      attendances: null == attendances
          ? _value.attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<Attendance>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClassroomCopyWith<$Res> implements $ClassroomCopyWith<$Res> {
  factory _$$_ClassroomCopyWith(
          _$_Classroom value, $Res Function(_$_Classroom) then) =
      __$$_ClassroomCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'nama')
          String name,
      @JsonKey(name: 'tahun_ajaran')
          String year,
      @JsonKey(name: 'kelompok')
          String group,
      String semester,
      @JsonKey(name: 'siswa')
      @ListStudentConverter()
          List<Student> students,
      @JsonKey(name: 'kehadiran')
      @ListAttendanceConverter()
          List<Attendance> attendances});
}

/// @nodoc
class __$$_ClassroomCopyWithImpl<$Res>
    extends _$ClassroomCopyWithImpl<$Res, _$_Classroom>
    implements _$$_ClassroomCopyWith<$Res> {
  __$$_ClassroomCopyWithImpl(
      _$_Classroom _value, $Res Function(_$_Classroom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? year = null,
    Object? group = null,
    Object? semester = null,
    Object? students = null,
    Object? attendances = null,
  }) {
    return _then(_$_Classroom(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as String,
      students: null == students
          ? _value._students
          : students // ignore: cast_nullable_to_non_nullable
              as List<Student>,
      attendances: null == attendances
          ? _value._attendances
          : attendances // ignore: cast_nullable_to_non_nullable
              as List<Attendance>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_Classroom implements _Classroom {
  const _$_Classroom(
      {required this.id,
      @JsonKey(name: 'nama')
          required this.name,
      @JsonKey(name: 'tahun_ajaran')
          required this.year,
      @JsonKey(name: 'kelompok')
          required this.group,
      required this.semester,
      @JsonKey(name: 'siswa')
      @ListStudentConverter()
          required final List<Student> students,
      @JsonKey(name: 'kehadiran')
      @ListAttendanceConverter()
          required final List<Attendance> attendances})
      : _students = students,
        _attendances = attendances;

  factory _$_Classroom.fromJson(Map<String, dynamic> json) =>
      _$$_ClassroomFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'nama')
  final String name;
  @override
  @JsonKey(name: 'tahun_ajaran')
  final String year;
  @override
  @JsonKey(name: 'kelompok')
  final String group;
  @override
  final String semester;
  final List<Student> _students;
  @override
  @JsonKey(name: 'siswa')
  @ListStudentConverter()
  List<Student> get students {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_students);
  }

  final List<Attendance> _attendances;
  @override
  @JsonKey(name: 'kehadiran')
  @ListAttendanceConverter()
  List<Attendance> get attendances {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attendances);
  }

  @override
  String toString() {
    return 'Classroom(id: $id, name: $name, year: $year, group: $group, semester: $semester, students: $students, attendances: $attendances)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Classroom &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.semester, semester) ||
                other.semester == semester) &&
            const DeepCollectionEquality().equals(other._students, _students) &&
            const DeepCollectionEquality()
                .equals(other._attendances, _attendances));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      year,
      group,
      semester,
      const DeepCollectionEquality().hash(_students),
      const DeepCollectionEquality().hash(_attendances));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClassroomCopyWith<_$_Classroom> get copyWith =>
      __$$_ClassroomCopyWithImpl<_$_Classroom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClassroomToJson(
      this,
    );
  }
}

abstract class _Classroom implements Classroom {
  const factory _Classroom(
      {required final String id,
      @JsonKey(name: 'nama')
          required final String name,
      @JsonKey(name: 'tahun_ajaran')
          required final String year,
      @JsonKey(name: 'kelompok')
          required final String group,
      required final String semester,
      @JsonKey(name: 'siswa')
      @ListStudentConverter()
          required final List<Student> students,
      @JsonKey(name: 'kehadiran')
      @ListAttendanceConverter()
          required final List<Attendance> attendances}) = _$_Classroom;

  factory _Classroom.fromJson(Map<String, dynamic> json) =
      _$_Classroom.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'nama')
  String get name;
  @override
  @JsonKey(name: 'tahun_ajaran')
  String get year;
  @override
  @JsonKey(name: 'kelompok')
  String get group;
  @override
  String get semester;
  @override
  @JsonKey(name: 'siswa')
  @ListStudentConverter()
  List<Student> get students;
  @override
  @JsonKey(name: 'kehadiran')
  @ListAttendanceConverter()
  List<Attendance> get attendances;
  @override
  @JsonKey(ignore: true)
  _$$_ClassroomCopyWith<_$_Classroom> get copyWith =>
      throw _privateConstructorUsedError;
}
