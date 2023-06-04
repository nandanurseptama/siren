import 'package:siren/cores/failures/network_failure/not_found_failure.dart';
import 'package:dio/dio.dart';
import 'package:siren/cores/failures/failure.dart';

/// catcher for any error on repository
Failure repositoryErrorHandler(
    {required dynamic err, StackTrace? trace, required String processId}) {
  if (err is Failure) {
    return err;
  }
  if (err is DioError) {
    var response = err.response;
    // when response was null
    //
    // return Failure with Internal Error message
    //
    if (response == null) {
      return Failure(
          message: "Internal Error",
          trace: StackTrace.fromString(
              "{error ${err.toString()}, trace : ${err.stackTrace}}"),
          processId: processId);
    }
    if (response.statusCode == null) {
      return Failure(
          message: "Internal Error",
          trace: StackTrace.fromString(
              "{error ${err.toString()}, trace : ${err.stackTrace}}"));
    }
    // when response body was null
    //
    // return Failure with Internal Error message
    //
    // this error may occured when no internet connection or there is an error in API
    if (response.data == null) {
      return Failure(
          message: "Internal Error",
          trace: StackTrace.fromString(
              "{error ${"Response data null"}, trace : $trace}"),
          processId: processId);
    }
    //
    // when response body message was null
    //
    // return Failure with Internal Error message
    //
    // this error occured when API send response with invalid body json
    //
    if (response.data['message'] == null) {
      var t = trace ?? StackTrace.fromString("Response API message null");
      return Failure(
          message: "Internal Error",
          trace: StackTrace.fromString(
              "{error ${"Response data null"}, trace : $t}"),
          processId: processId);
    }
    //
    // when response body message was not string
    //
    // return Failure with Internal Error message
    //
    // this error occured when API send response with invalid body message type
    //
    if (response.data['message'] is! String) {
      var t = trace ?? StackTrace.fromString("Response API message not string");
      return Failure(
          message: "Internal Error",
          trace: StackTrace.fromString(
              "{error ${"Response API message not string"}, trace : $t}"),
          processId: processId);
    }
    if (response.statusCode! == 404) {
      return NotFoundFailure(
          message: response.data['message'],
          trace: StackTrace.fromString(
              "{error ${response.data['message']}, trace : ${err.stackTrace}}"));
    }
    //return failure with API response message
    return Failure(
        message: response.data['message']!,
        trace: StackTrace.fromString(
            "{error ${response.data['message']}, trace : ${err.stackTrace}}"),
        processId: processId);
  }
  var t = StackTrace.fromString(
      "{error ${err.toString()}, trace : ${StackTrace.current}}");
  // This error occured from internal function
  return Failure(message: "Internal Error", trace: t, processId: processId);
}
