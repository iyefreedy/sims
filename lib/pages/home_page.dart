import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sims/enums/roles.dart';
import 'package:sims/models/cloud_user.dart';
import 'package:sims/pages/student_page.dart';
import 'package:sims/pages/teacher_page.dart';
import 'package:sims/services/auth/auth_service.dart';
import 'package:sims/services/auth/bloc/auth_bloc.dart';
import 'package:sims/services/cloud/firebase_cloud_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _widgets = [
    const StudentPage(),
    const TeacherPage(),
  ];
  late PageController _pageController;
  late FirebaseCloudStorage _cloudServices;
  final int _selectedPage = 0;
  String get userId => AuthService.firebase().currentUser!.id;

  Future<Roles> _getUserRole() async {
    return await _cloudServices.getUserRole(userId);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedPage);
    _cloudServices = FirebaseCloudStorage();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Roles>(
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
              final userRole = snapshot.data as Roles;

              if (userRole == Roles.student) {
                return const StudentPage();
              } else {
                return const TeacherPage();
              }
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
}
