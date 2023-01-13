import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sims/app/routes.dart';
import 'package:sims/state/auth/provider/auth_logged_in_provider.dart';
import 'package:sims/state/auth/provider/auth_state_provider.dart';
import 'package:sims/views/auth/authorization_role_widget.dart';
import 'package:sims/views/auth/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(
    preferences: sharedPreferences,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.preferences,
  });

  final SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(preferences)],
      child: MaterialApp(
        title: 'SiMS',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme.light(
            primary: Color(0xff386a20),
            onPrimary: Color(0xffffffff),
            primaryContainer: Color(0xffb7f397),
            onPrimaryContainer: Color(0xff042100),
            secondary: Color(0xffb7f397),
            onSecondary: Color(0xffffffff),
            secondaryContainer: Color(0xffd9e7cb),
            onSecondaryContainer: Color(0xffd9e7cb),
            tertiary: Color(0xff19686a),
            onTertiary: Color(0xffffffff),
            tertiaryContainer: Color(0xffa8eff0),
            onTertiaryContainer: Color(0xff002021),
          ),
          listTileTheme: const ListTileThemeData(
            tileColor: Color(0xffb7f397),
          ),
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        onGenerateRoute: onGenerateRoutes,
        home: Consumer(
          builder: (context, ref, child) {
            final isLoggedIn = ref.watch(authLoggedInProvider);

            if (isLoggedIn) {
              return const AuthroziationRoleWidget();
            } else {
              return const LoginView();
            }
            // }
          },
        ),
      ),
    );
  }
}
