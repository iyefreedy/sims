import 'package:freezed_annotation/freezed_annotation.dart';

enum AttendanceType {
  @JsonValue('Hadir')
  present('Hadir'),
  @JsonValue('Tanpa Keterangan')
  absent('Tanpa Keterangan'),
  @JsonValue('Sakit')
  sick('Sakit'),
  @JsonValue('Izin')
  permit('Izin');

  const AttendanceType(this.name);
  final String name;
}
