import 'package:json_annotation/json_annotation.dart';

class StringDateTimeConverter implements JsonConverter<DateTime, String> {
  const StringDateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.toIso8601String();
}
