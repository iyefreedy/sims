import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/auth/provider/auth_state_provider.dart';
import 'package:sims/state/auth/provider/auth_token_provider.dart';

final authUserProvider = FutureProvider.autoDispose((ref) async {
  final authService = ref.read(authServiceProvider);
  final token = ref.read(authTokenProvider);

  return await authService.getUser(token: token);
});
