import 'package:flutter/material.dart';
import 'package:sims/utilities/dialogs/generic_dialog.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Log Out',
    content: 'Apakah anda ingin keluar ?',
    optionsBuilder: () => {
      'Batal': false,
      'Ya': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
