import 'package:flutter/material.dart';
import 'package:sims/enums/roles.dart';
import 'package:sims/models/auth_user.dart';
import 'package:sims/pages/admin_page.dart';
import 'package:sims/pages/student_page.dart';
import 'package:sims/pages/teacher_page.dart';
import 'package:sims/services/auth/auth_service.dart';
import 'package:sims/services/cloud/firebase_cloud_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FirebaseCloudStorage _cloudServices;

  String get userId => AuthService.firebase().currentUser!.id;
  AuthUser get user => AuthService.firebase().currentUser!;

  Future<String> _getUserRole() async {
    return await _cloudServices.getUserRole(user);
  }

  @override
  void initState() {
    super.initState();

    _cloudServices = FirebaseCloudStorage();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getUserRole(),
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
            if (snapshot.hasData) {
              final userRole = snapshot.data;

              if (userRole == 'admin') {
                return const AdminPage();
              } else if (userRole == 'guru') {
                return const TeacherPage();
              } else {
                return const StudentPage();
              }
            } else {
              return const AdminPage();
            }
        }
      },
    );
  }
}
