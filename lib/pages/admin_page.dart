import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sims/constants/routes.dart';
import 'package:sims/enums/menu_action.dart';
import 'package:sims/services/auth/bloc/auth_bloc.dart';
import 'package:sims/utilities/dialogs/logout_dialog.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
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
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Data Siswa'),
            onTap: () {
              Navigator.of(context).pushNamed('data-siswa');
            },
          ),
          ListTile(
            title: Text('Data Kelas'),
            onTap: () => Navigator.of(context).pushNamed(classRoute),
          ),
          ListTile(
            title: Text('Data Guru'),
          ),
          ListTile(
            title: Text('Data Mata Pelajaran'),
          ),
          ListTile(
            title: Text('Jadwal Kelas'),
          )
        ],
      ),
    );
  }
}
