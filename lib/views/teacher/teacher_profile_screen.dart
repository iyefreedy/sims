import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:sims/state/auth/provider/auth_user_provider.dart';
import 'package:sims/state/models/teacher.dart';
import 'package:sims/widgets/shimmer_loading_list.dart';

class TeacherProfileScreen extends ConsumerWidget {
  const TeacherProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(authUserProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Guru'),
      ),
      body: userAsyncValue.when(
        data: (data) {
          final teacher = data.teacher!;

          return ListView(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.network(
                  'https://robohash.org/hicveldicta.png?size=100x100&set=set1',
                ),
              ),
              ...ListTile.divideTiles(
                context: context,
                tiles: [
                  ListTile(
                    title: const Text('NUPTK'),
                    subtitle: Text(teacher.nuptk),
                  ),
                  ListTile(
                    title: const Text('Nama'),
                    subtitle: Text(teacher.name),
                  ),
                  ListTile(
                    title: const Text('Jenis Kelamin'),
                    subtitle: Text(teacher.gender),
                  ),
                  ListTile(
                    title: const Text('Alamat'),
                    subtitle: Text(teacher.address),
                  ),
                  ListTile(
                    title: const Text('Tempat Lahir'),
                    subtitle: Text(teacher.birthPlace),
                  ),
                  ListTile(
                    title: const Text('Tanggal Lahir'),
                    subtitle: Text(
                      DateFormat('dd-MM-yyyy').format(teacher.birthDate),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        error: (error, stackTrace) => Center(
          child: ErrorWidget(error),
        ),
        loading: () => const ShimmerLoadingList(),
      ),
    );
  }
}
