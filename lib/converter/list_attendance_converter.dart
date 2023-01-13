import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sims/state/models/attendance.dart';

class ListAttendanceConverter implements JsonConverter<List<Attendance>, List> {
  const ListAttendanceConverter();
  @override
  List<Attendance> fromJson(List json) {
    return json.map((e) => Attendance.fromJson(e)).toList();
  }

  @override
  List toJson(List<Attendance> object) {
    return object.map((e) => e.toJson()).toList();
  }
}
