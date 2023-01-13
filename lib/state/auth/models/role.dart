import 'package:freezed_annotation/freezed_annotation.dart';

enum Role {
  @JsonValue('siswa')
  siswa,
  @JsonValue('guru')
  guru,
}
