import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sims/state/models/classroom.dart';
import 'package:sims/state/models/course.dart';
import 'package:sims/state/models/teacher.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    required String id,
    @JsonKey(name: 'hari') required int day,
    @JsonKey(name: 'jam_mulai') required String startTime,
    @JsonKey(name: 'jam_selesai') required String endTime,
    @JsonKey(name: 'kelas') required Classroom classroom,
    @JsonKey(name: 'mata_pelajaran') required Course course,
    @JsonKey(name: 'guru') required Teacher teacher,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}
