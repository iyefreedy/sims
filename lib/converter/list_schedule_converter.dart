import 'package:freezed_annotation/freezed_annotation.dart';

import '../state/models/schedule.dart';

class ListScheduleConverter implements JsonConverter<List<Schedule>, List> {
  const ListScheduleConverter();
  @override
  List<Schedule> fromJson(List json) {
    return json.map((e) => Schedule.fromJson(e)).toList();
  }

  @override
  List toJson(List<Schedule> object) {
    return object.map((e) => e.toJson()).toList();
  }
}
