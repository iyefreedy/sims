import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sims/app/routes.dart';
import 'package:sims/arguments/teacher_classroom_arguments.dart';
import 'package:sims/enum/classroom_argument_type.dart';
import 'package:sims/state/auth/provider/auth_user_provider.dart';
import 'package:sims/state/models/teacher.dart';
import 'package:sims/utilites/dialogs/logout_dialog.dart';
import 'package:sims/widgets/shimmer_card.dart';
import 'package:sims/widgets/shimmer_grid.dart';

import '../../enum/menu_action.dart';
import '../../state/auth/provider/auth_state_provider.dart';

class TeacherHomeScreen extends ConsumerWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(authUserProvider);

    return Scaffold(
      appBar: _buildAppBar(context, ref),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: userAsyncValue.when(
          data: (data) {
            final teacher = data.teacher!;
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _TeacherCard(teacher: teacher),
                const SizedBox(height: 20.0),
                Text(
                  'Menu',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                    ),
                    children: [
                      Card(
                        elevation: 2.0,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(teacherScheduleRoute);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.schedule,
                                color: Colors.redAccent,
                                size: 50.0,
                              ),
                              Text('Jadwal'),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2.0,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              teacherClassroomRoute,
                              arguments: ClassroomType.attendance,
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.analytics,
                                color: Colors.blueAccent,
                                size: 50.0,
                              ),
                              Text('Kehadiran'),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2.0,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              teacherClassroomRoute,
                              arguments: ClassroomType.grade,
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.score,
                                color: Colors.purpleAccent,
                                size: 50.0,
                              ),
                              Text('Nilai'),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 2.0,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(teacherProfileRoute);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.person,
                                color: Colors.amberAccent,
                                size: 50.0,
                              ),
                              Text('Profil'),
                            ],
                          ),
                        ),
                      ),
                      if (teacher.classroomId != null)
                        Card(
                          elevation: 2.0,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                teacherConsultRoute,
                                arguments: teacher.classroomId,
                              );
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.chat,
                                  color: Colors.tealAccent,
                                  size: 50.0,
                                ),
                                Text('Konsultasi'),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            );
          },
          error: (e, s) => ErrorWidget(e),
          loading: () => const ShimmerGridLoading(),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text('Dashboard - Guru'),
      actions: [
        PopupMenuButton<MenuAction>(
          onSelected: (value) async {
            switch (value) {
              case MenuAction.logout:
                final shouldLogout = await showLogoutDialog(context);
                if (shouldLogout) {
                  ref.read(authStateProvider.notifier).logout();
                }
                break;
            }
          },
          itemBuilder: (context) {
            return const [
              PopupMenuItem<MenuAction>(
                value: MenuAction.logout,
                child: Text('Logout'),
              ),
            ];
          },
        ),
      ],
    );
  }
}

class _TeacherCard extends StatelessWidget {
  const _TeacherCard({
    Key? key,
    required this.teacher,
  }) : super(key: key);

  final Teacher teacher;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      elevation: 4.0,
      shadowColor: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.green.shade200,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.network(
              'https://robohash.org/hicveldicta.png?size=100x100&set=set1',
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  teacher.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w500),
                  overflow: TextOverflow.fade,
                ),
                Text(teacher.nuptk),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
