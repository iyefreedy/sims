import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sims/services/auth/bloc/auth_bloc.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verifikasi email'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                'Kami telah mengirimkan verifikasi email kepada Anda. Silakan buka untuk memverifikasi akun Anda. Jika Anda belum menerima email verifikasi, tekan tombol di bawah!'),
          ),
          TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(AuthEventSendEmailVerification());
            },
            child: const Text('Kirim verifikasi email'),
          ),
          TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(const AuthEventLogOut());
            },
            child: const Text('Kembali'),
          ),
        ],
      ),
    );
  }
}
