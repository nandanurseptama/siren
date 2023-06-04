import 'package:siren/cores/failures/failure.dart';

class BadRequestFailure extends Failure {
  BadRequestFailure({super.message = "Bad Request", super.processId})
      : super(trace: StackTrace.fromString("Invalid Response Type"));
}
