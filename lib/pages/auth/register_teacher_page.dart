import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sims/services/auth/auth_exceptions.dart';
import 'package:sims/services/auth/bloc/auth_bloc.dart';
import 'package:sims/utilities/dialogs/error_dialog.dart';

class RegisterTeacherPage extends StatefulWidget {
  const RegisterTeacherPage({Key? key}) : super(key: key);

  @override
  State<RegisterTeacherPage> createState() => _RegisterTeacherPageState();
}

class _RegisterTeacherPageState extends State<RegisterTeacherPage> {
  late TextEditingController _uniqueNumberController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _uniqueNumberController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateLoggedOut) {
          final e = state.exception;
          if (e is InvalidEmailAuthException) {
            await showErrorDialog(context, e.message);
          } else if (e is WeakPasswordAuthException) {
            await showErrorDialog(context, e.message);
          } else if (e is EmailAlreadyInUseAuthException) {
            await showErrorDialog(context, e.message);
          } else if (e is GenericAuthException) {
            await showErrorDialog(context, e.message!);
          }
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.center,
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo-sims.png'),
                    const SizedBox(height: 10.0),
                    TextField(
                      controller: _uniqueNumberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                      ],
                      decoration: const InputDecoration(
                        hintText: 'Masukkan Nomor Guru',
                      ),
                    ),
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan email',
                      ),
                    ),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan kata sandi',
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          final uniqueNumber = _uniqueNumberController.text;
                          final email = _emailController.text;
                          final password = _passwordController.text;

                          context.read<AuthBloc>().add(AuthEventRegister(
                                role: 'guru',
                                uniqueNumber: uniqueNumber,
                                email: email,
                                password: password,
                              ));
                        },
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        child: const Text('Daftar'),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * .05,
                  child: Row(
                    children: [
                      const Text('Sudah terdafar?'),
                      TextButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(const AuthEventLogOut());
                        },
                        child: const Text('Login disini'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
