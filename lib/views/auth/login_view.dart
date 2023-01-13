import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sims/state/auth/provider/auth_loading_provider.dart';
import 'package:sims/state/auth/provider/auth_state_provider.dart';
import 'package:sims/widgets/loading/loading_view.dart';

import '../../state/auth/provider/auth_error_provider.dart';
import '../../utilites/dialogs/error_dialog.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? emailValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Harap isi kolom alamat email';
    }

    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);

    if (!emailValid) {
      return 'Alamat email tidak valid';
    }

    return null;
  }

  void _onPressedLogin() {
    final isValidated = _formKey.currentState?.validate() ?? false;
    if (isValidated) {
      final email = _emailController.text;
      final password = _passwordController.text;
      ref
          .read(authStateProvider.notifier)
          .login(email: email, password: password);
    }
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<String?>(
      authErrorProvider,
      (previous, next) {
        if (next != null) {
          showErrorDialog(
            context,
            next,
          );
        }
      },
      onError: (error, stackTrace) {
        print('Error : $error');
        print('What is going on ? $stackTrace');
      },
    );

    ref.listen<bool>(
      authLoadingProvider,
      (previous, next) {
        if (next) {
          LoadingView().show(context: context, text: 'Please wait...');
        } else {
          LoadingView().hide();
        }
      },
    );

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .9,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 32.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    title,
                    description,
                    const SizedBox(height: 24.0),
                    emailFormField,
                    const SizedBox(height: 8.0),
                    _PasswordFormField(
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 16.0),
                    loginButton,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton get loginButton {
    return ElevatedButton(
      onPressed: _onPressedLogin,
      child: const Text('Login'),
    );
  }

  TextFormField get emailFormField {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: emailValidator,
      decoration: const InputDecoration(
        isDense: true,
        hintText: 'Alamat email',
        prefixIcon: Icon(Icons.email),
      ),
    );
  }

  Text get description {
    return Text(
      'Sistem Informasi Monitoring Siswa',
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Text get title {
    return Text(
      'SiMS',
      style: Theme.of(context).textTheme.displayMedium,
    );
  }
}

class _PasswordFormField extends StatefulWidget {
  const _PasswordFormField({
    required this.controller,
  });
  final TextEditingController controller;

  @override
  State<_PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<_PasswordFormField> {
  late TextEditingController controller = widget.controller;

  bool _isVisible = false;

  void _onTapVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: !_isVisible,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Kata sandi tidak boleh kosong';
        }

        return null;
      },
      decoration: InputDecoration(
        hintText: 'Kata Sandi',
        prefixIcon: const Icon(Icons.password),
        suffixIcon: InkWell(
          onTap: _onTapVisibility,
          child: _isVisible
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ),
      ),
    );
  }
}
