import 'package:flutter/material.dart';
import 'package:sims/utilites/dialogs/generic_dialog.dart';

Future<void> showErrorDialog(BuildContext context, String message) {
  return showGenericDialog(
    context: context,
    title: 'Terjadi Kesalahan',
    content: message,
    optionBuilder: () => {
      'OK': null,
    },
  );
}
