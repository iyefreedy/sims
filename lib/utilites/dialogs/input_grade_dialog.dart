import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sims/utilites/dialogs/generic_dialog.dart';

Future<TextEditingController?> showInputGradeDialog(
    BuildContext context, TextEditingController textEditingController) {
  return showGenericDialog<TextEditingController?>(
    context: context,
    title: 'Ubah Nilai',
    widget: TextFormField(
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      controller: textEditingController,
    ),
    optionBuilder: () => {
      'OK': textEditingController,
    },
  ).then(
    (value) => value,
  );
}
