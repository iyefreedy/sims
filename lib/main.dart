import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sims/constants/routes.dart';
import 'package:sims/helpers/loading/loading_screen.dart';
import 'package:sims/pages/admin/class_page.dart';
import 'package:sims/pages/admin/student_list_page.dart';
import 'package:sims/pages/auth/register_student_page.dart';
import 'package:sims/pages/auth/register_teacher_page.dart';
import 'package:sims/pages/auth/verification_page.dart';
import 'package:sims/pages/home_page.dart';
import 'package:sims/pages/auth/login_page.dart';

import 'package:sims/services/auth/bloc/auth_bloc.dart';
import 'package:sims/services/auth/firebase_auth_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.openSansTextTheme(),
          scaffoldBackgroundColor: const Color(0xffF5F4F4)),
      routes: {
        loginRoute: (context) => const LoginPage(),
        registerRoute: (context) => const RegisterStudentPage(),
        homeRoute: (context) => const HomePage(),
        'data-siswa': (context) => const StudentListPage(),
        classRoute: (context) => const ClassPage(),
      },
      home: BlocProvider(
        create: (context) => AuthBloc(FirebaseAuthProvider()),
        child: const InitalPage(),
      ),
    );
  }
}

class InitalPage extends StatelessWidget {
  const InitalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(AuthEventInitialize());

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen().show(
            context: context,
            text: state.loadingText ?? 'Please wait a moment',
          );
        } else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        if (state is AuthStateLoggedOut) {
          debugPrint(state.toString());
          return const LoginPage();
        } else if (state is AuthStateRegistering) {
          switch (state.role) {
            case 'guru':
              return const RegisterTeacherPage();
            default:
              return const RegisterStudentPage();
          }
        } else if (state is AuthStateLoggedIn) {
          debugPrint(state.toString());
          return const HomePage();
        } else if (state is AuthStateNeedsVerification) {
          return const VerificationPage();
        } else {
          debugPrint(state.toString());
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
