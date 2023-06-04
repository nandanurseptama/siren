import 'package:siren/cores/failures/failure.dart';

class InternalServerErrorFailure extends Failure {
  InternalServerErrorFailure(
      {super.message = "Internal Server Error", super.processId})
      : super(trace: StackTrace.fromString("Invalid Response Type"));
}
