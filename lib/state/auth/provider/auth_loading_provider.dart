import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_state_provider.dart';

final authLoadingProvider = StateProvider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.isLoading;
});
