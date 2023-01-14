import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sims/state/auth/models/role.dart';
import 'package:sims/state/models/student.dart';
import 'package:sims/state/models/teacher.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true)
  factory User({
    required String id,
    required Role role,
    @JsonKey(name: 'guru') required Teacher? teacher,
    @JsonKey(name: 'siswa') required Student? student,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
