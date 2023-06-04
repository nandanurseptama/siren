import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String title, message;
  final VoidCallback? onYes, onNo;
  const ConfirmDialog(
      {super.key,
      required this.message,
      required this.title,
      this.onYes,
      this.onNo});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(title),
        actions: [
          TextButton(onPressed: onNo, child: const Text("No")),
          TextButton(onPressed: onYes, child: const Text("Yes")),
        ],
        content: Text(
          message,
          maxLines: 3,
        ));
  }
}
