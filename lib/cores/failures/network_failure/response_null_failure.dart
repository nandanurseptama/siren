import 'package:siren/cores/failures/failure.dart';

class ResponseNullFailure extends Failure {
  ResponseNullFailure(
      {super.message = "Internal Server Error", super.processId = ""})
      : super(trace: StackTrace.fromString("Null Response"));
}
