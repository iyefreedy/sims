import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/auth/provider/auth_state_provider.dart';

final authTokenProvider = StateProvider<String>((ref) {
  final authState = ref.watch(authStateProvider);

  return authState.token!;
});
