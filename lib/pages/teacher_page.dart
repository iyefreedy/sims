import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sims/enums/menu_action.dart';
import 'package:sims/models/cloud_user.dart';
import 'package:sims/services/auth/auth_service.dart';
import 'package:sims/services/auth/bloc/auth_bloc.dart';
import 'package:sims/services/cloud/firebase_cloud_storage.dart';
import 'package:sims/utilities/dialogs/logout_dialog.dart';

class TeacherPage extends StatefulWidget {
  const TeacherPage({Key? key}) : super(key: key);

  @override
  State<TeacherPage> createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  late FirebaseCloudStorage _cloudServices;
  String get userId => AuthService.firebase().currentUser!.id;

  Future<CloudUser> getUser() async {
    return await _cloudServices.getUser(userId);
  }

  @override
  void initState() {
    super.initState();

    _cloudServices = FirebaseCloudStorage();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CloudUser>(
      future: getUser(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case ConnectionState.active:
          case ConnectionState.waiting:
          case ConnectionState.done:
            if (snapshot.hasData && snapshot.data != null) {
              final user = snapshot.data as CloudUser;
              final size = MediaQuery.of(context).size;

              return Scaffold(
                appBar: _buildAppBar(),
                drawer: Drawer(
                  child: ListView(
                    children: [
                      DrawerHeader(
                        decoration: BoxDecoration(
                          color: Colors.green.shade200,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.person),
                            ),
                            Text(
                              user.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.0,
                              ),
                            ),
                            Text(user.id),
                          ],
                        ),
                      ),
                      const ListTile(
                        style: ListTileStyle.drawer,
                        title: Text('Guru'),
                      ),
                    ],
                  ),
                ),
                body: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height,
                      padding: const EdgeInsets.only(
                        top: 20.0,
                        left: 12.0,
                        right: 12.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Halo, ${user.name}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Text(user.id),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 18.0,
                          left: 14.0,
                          right: 14.0,
                        ),
                        height: size.height * .7,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: const Color(0xffCAE4DB),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24.0),
                            topRight: Radius.circular(24.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xffCAE4DB).withOpacity(.4),
                              offset: const Offset(0, 3.5),
                              blurRadius: 6.0,
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Kelas hari ini',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.only(top: 10.0),
                              width: size.width,
                              decoration: BoxDecoration(
                                color: const Color(0xffCDAC81),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  SizedBox(
                                    child: Text(
                                      'Tematik  - 1B',
                                      style: TextStyle(
                                        color: Color(0xff00303F),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '07:30 - 09:00',
                                    style: TextStyle(
                                      color: Color(0xff00303F),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10.0),
                              margin: const EdgeInsets.only(top: 10.0),
                              width: size.width,
                              decoration: BoxDecoration(
                                color: const Color(0xffCDAC81),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  SizedBox(
                                    child: Text(
                                      'Aqidah Akhlak - 1A',
                                      style: TextStyle(
                                        color: Color(0xff00303F),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '09:00 - 10:30',
                                    style: TextStyle(
                                      color: Color(0xff00303F),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              final error = snapshot.error;
              return Scaffold(
                body: Center(
                  child: Text(error.toString()),
                ),
              );
            } else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
        }
      },
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text('Guru'),
      titleTextStyle: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w700,
        color: Colors.black.withAlpha(200),
      ),
      // leading: Icon(Icons.dashboard),
      elevation: 0,
      centerTitle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      foregroundColor: Colors.black.withAlpha(200),
      actions: [
        PopupMenuButton<MenuAction>(
          onSelected: (value) async {
            switch (value) {
              case MenuAction.logout:
                final shouldLogout = await showLogOutDialog(context);
                if (shouldLogout) {
                  context.read<AuthBloc>().add(const AuthEventLogOut());
                }
            }
          },
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: MenuAction.logout,
                child: Text('Logout'),
              )
            ];
          },
        )
      ],
    );
  }
}
