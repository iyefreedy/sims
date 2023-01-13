import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/auth/provider/auth_token_provider.dart';
import 'package:sims/state/teacher/teacher_service.dart';

final teacherServiceProvider = Provider((ref) {
  final token = ref.watch(authTokenProvider);

  return TeacherService(token);
});
