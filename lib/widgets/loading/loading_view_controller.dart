import 'package:flutter/foundation.dart' show immutable;

typedef CloseLoadingScreen = bool Function();
typedef UpdateLoadingScreen = bool Function(String text);

@immutable
class LoadingViewController {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;

  const LoadingViewController({
    required this.close,
    required this.update,
  });
}
