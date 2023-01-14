import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/auth/models/user.dart';
import 'package:sims/state/auth/provider/auth_state_provider.dart';
import 'package:sims/state/auth/provider/auth_token_provider.dart';

final authUserProvider = FutureProvider.autoDispose<User>((ref) async {
  final authService = ref.read(authServiceProvider);
  final token = ref.read(authTokenProvider);

  final user = await authService.getUser(token: token);

  return user;
});
