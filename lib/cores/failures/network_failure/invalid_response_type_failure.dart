import 'package:siren/cores/failures/failure.dart';

class InvalidResponseTypeFailure extends Failure {
  InvalidResponseTypeFailure(
      {super.message = "Internal Server Error", super.processId})
      : super(trace: StackTrace.fromString("Invalid Response Type"));
}
