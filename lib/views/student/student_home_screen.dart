import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/enum/menu_action.dart';
import 'package:sims/state/auth/provider/auth_state_provider.dart';
import 'package:sims/state/auth/provider/auth_user_provider.dart';
import 'package:sims/state/models/student.dart';
import 'package:sims/utilites/dialogs/logout_dialog.dart';

import '../../app/routes.dart';
import '../../arguments/teacher_classroom_arguments.dart';
import '../../enum/classroom_argument_type.dart';
import '../../widgets/shimmer_card.dart';

class StudentHomeScreen extends ConsumerWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(authUserProvider);
    return Scaffold(
      appBar: _buildStudentAppBar(context, ref),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(8.0).copyWith(top: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            userAsyncValue.when(
              data: (data) {
                final teacher =
                    Student.fromJson(data.info as Map<String, dynamic>);
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
                            Text(teacher.nisn),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              error: (error, stackTrace) {
                return ErrorWidget(error);
              },
              loading: () => const ShimmerLoadingCard(),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Menu',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                children: [
                  Card(
                    elevation: 2.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(studentScheduleRoute);
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
                        Navigator.of(context).pushNamed(studentCourseRoute);
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
                        Navigator.of(context).pushNamed(studentGradeRoute);
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
                        Navigator.of(context).pushNamed(teacherProfileRoute);
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildStudentAppBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text('SiMS - Wali Murid'),
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
