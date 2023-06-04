import 'package:equatable/equatable.dart';

/// A class that represent error
class Failure extends Equatable implements Exception {
  /// Used for logging purposes
  final String processId;
  // Pass this value to UI. i would assume the error message from Remote API has meaningfull message to User
  final String message;

  /// Used for logging purposes. Pass technical error to this property
  final StackTrace trace;

  const Failure(
      {required this.message, required this.trace, this.processId = ""});
  factory Failure.unknownError({
    required StackTrace trace,
    required String processId,
  }) {
    return Failure(
        message: "Unknown Error", trace: trace, processId: processId);
  }
  Failure copyWith({
    StackTrace? trace,
    String? processId,
    String? message,
  }) {
    return Failure(
        message: message ?? this.message,
        trace: trace ?? this.trace,
        processId: processId ?? this.processId);
  }

  Map<String, dynamic> toJson() {
    return {
      "processId": processId,
      "message": message,
      "trace": trace.toString()
    };
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [message, trace, processId];
}
