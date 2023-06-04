// ignore_for_file: use_build_context_synchronously

import 'package:siren/cores/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorDialog extends StatelessWidget {
  final String title, message;
  final String processId;
  const ErrorDialog(
      {super.key,
      required this.processId,
      this.message = "Unkown error occured",
      this.title = "Error"});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(title),
        actions: [
          TextButton(
              onPressed: () {
                onCopy(context);
                return;
              },
              child: const Text("Copy Error Ticket")),
          TextButton(
              onPressed: () {
                onClose(context);
                return;
              },
              child: const Text("Close")),
        ],
        content: Text(
          message,
          maxLines: 3,
        ));
  }

  void onCopy(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: processId));
    onClose(context);
    showSnackbarMessage(context: context, message: "Copied", type: SnackbarType.info);
    return;
  }

  void onClose(BuildContext context) {
    Navigator.pop(context);
    return;
  }
}
