import 'package:flutter/material.dart';
import 'package:sims/utilites/dialogs/generic_dialog.dart';

Future<bool> showLogoutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Keluar',
    content: 'Apakah anda yakin ingin keluar ?',
    optionBuilder: () => {
      'OK': true,
      'Batal': false,
    },
  ).then(
    (value) => value ?? false,
  );
}
