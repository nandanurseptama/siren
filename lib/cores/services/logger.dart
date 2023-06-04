// Black:   \x1B[30m
// Red:     \x1B[31m
// Green:   \x1B[32m
// Yellow:  \x1B[33m
// Blue:    \x1B[34m
// Magenta: \x1B[35m
// Cyan:    \x1B[36m
// White:   \x1B[37m
import 'dart:convert';

import 'package:flutter/cupertino.dart';

enum LogType {
  info,
  error,
  success;
}

abstract class Logger {
  List<Logger> get loggers;
  void info(String message);
  void error(String message);
  void success(String message);
  void jsonify({required LogType type, required Map<dynamic, dynamic> data});
}

class CmdLogger implements Logger {
  @override
  final List<Logger> loggers;
  CmdLogger({this.loggers = const []});

  @override
  void error(String message) {
    debugPrint("\x1B[31mError:\t\x1B[0m$message\t${DateTime.now()}");
    for (var i = 0; i < loggers.length; i++) {
      loggers[i].error(message);
    }
    return;
  }

  @override
  void info(String message) {
    debugPrint("\x1B[34mError:\t\x1B[0m$message\t${DateTime.now()}");
    for (var i = 0; i < loggers.length; i++) {
      loggers[i].info(message);
    }
    return;
  }

  @override
  void success(String message) {
    debugPrint("\x1B[32mError:\t\x1B[0m$message\t${DateTime.now()}");
    for (var i = 0; i < loggers.length; i++) {
      loggers[i].success(message);
    }
    return;
  }

  @override
  void jsonify({required LogType type, required Map<dynamic, dynamic> data}) {
    var dataString = jsonEncode(data);
    if (type == LogType.info) {
      return info(dataString);
    }
    if (type == LogType.error) {
      return error(dataString);
    }
    return success(dataString);
  }
}
