import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/api_service.dart';

final scheduleListProvider = FutureProvider.autoDispose((ref) async {
  final service = ref.watch(apiServiceProvider);

  final scheduleList = await service.getSchedules();

  return scheduleList;
});
