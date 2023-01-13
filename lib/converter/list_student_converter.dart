import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sims/state/models/student.dart';

class ListStudentConverter implements JsonConverter<List<Student>, List> {
  const ListStudentConverter();
  @override
  List<Student> fromJson(List json) {
    return json.map((e) => Student.fromJson(e)).toList();
  }

  @override
  List toJson(List<Student> object) {
    return object.map((e) => e.toJson()).toList();
  }
}
