import 'package:flutter/material.dart';

enum SnackbarType {
  error,
  warning,
  success,
  info;

  const SnackbarType();

  Color get color {
    if (this == SnackbarType.error) {
      return Colors.red.shade500;
    }
    if (this == SnackbarType.warning) {
      return Colors.orange.shade500;
    }
    if (this == SnackbarType.info) {
      return Colors.grey.shade700;
    }
    return Colors.green.shade500;
  }
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackbarMessage(
    {required BuildContext context,
    required String message,
    SnackbarType type = SnackbarType.info,
    Duration duration = const Duration(seconds: 1)}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: Colors.white
    ),),
    backgroundColor: type.color,
    duration: duration,
  ));
}
