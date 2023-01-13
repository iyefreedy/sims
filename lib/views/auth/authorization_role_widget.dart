import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/views/student/student_home_screen.dart';
import 'package:sims/views/teacher/teacher_home_screen.dart';
import 'package:sims/widgets/loading_screen.dart';

import '../../state/auth/models/role.dart';
import '../../state/auth/provider/auth_error_provider.dart';
import '../../state/auth/provider/auth_loading_provider.dart';
import '../../state/auth/provider/auth_user_provider.dart';
import '../../utilites/dialogs/error_dialog.dart';
import '../../widgets/error_screen.dart';
import '../../widgets/loading/loading_view.dart';

class AuthroziationRoleWidget extends ConsumerWidget {
  const AuthroziationRoleWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<String?>(
      authErrorProvider,
      (previous, next) {
        if (next != null) {
          showErrorDialog(
            context,
            next,
          );
        }
      },
    );

    ref.listen<bool>(
      authLoadingProvider,
      (previous, next) {
        if (next) {
          LoadingView().show(context: context, text: 'Please wait...');
        } else {
          LoadingView().hide();
        }
      },
    );
    final user = ref.watch(authUserProvider);

    return user.when(
      data: (data) {
        final role = data.role;
        switch (role) {
          case Role.guru:
            return const TeacherHomeScreen();
          case Role.siswa:
            return const StudentHomeScreen();
          default:
            return const Scaffold(
              body: Center(
                child: Text('Not found'),
              ),
            );
        }
      },
      error: (error, stackTrace) => ErrorScreen(error: '$error'),
      loading: () => const LoadingScreen(),
    );
  }
}
