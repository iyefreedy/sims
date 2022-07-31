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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guru'),
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
                  child: Text('Logout'),
                  value: MenuAction.logout,
                )
              ];
            },
          )
        ],
      ),
      body: FutureBuilder<CloudUser>(
        future: getUser(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.waiting:
            case ConnectionState.done:
              if (snapshot.hasData && snapshot.data != null) {
                final user = snapshot.data as CloudUser;

                return Column(
                  children: [
                    Text(user.name),
                    Text(user.gender),
                    Text(user.birthPlace),
                    Text(user.birthDate.toDate().toString())
                  ],
                );
              } else if (snapshot.hasError) {
                final error = snapshot.error;
                return Center(
                  child: Text(error.toString()),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
          }
        },
      ),
    );
  }
}
