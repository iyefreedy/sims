import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/api_service.dart';
import 'package:sims/state/models/classroom.dart';

final classroomProvider = FutureProvider.autoDispose.family<Classroom, String>(
  (ref, arg) async {
    final service = ref.watch(apiServiceProvider);

    final classroom = await service.getClassroom(arg);

    return classroom;
  },
);
