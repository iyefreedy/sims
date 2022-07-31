import 'package:flutter/material.dart';
import 'package:sims/utilities/dialogs/generic_dialog.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog<void>(
    context: context,
    title: 'Terjadi Kesalahan',
    content: text,
    optionsBuilder: () => {
      'OK': null,
    },
  );
}
