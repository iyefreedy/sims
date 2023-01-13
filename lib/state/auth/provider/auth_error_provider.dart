import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/auth/provider/auth_state_provider.dart';

final authErrorProvider = StateProvider<String?>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.error;
});
