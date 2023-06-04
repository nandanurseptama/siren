import 'package:dio/dio.dart';

extension DioExtension on Dio {
  Future<Response<T>> postWithRequestId<T>(
    String path,
    String requestId, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    var optionHeaders = options?.headers;
    var headers = optionHeaders == null
        ? {
            "Request-Id": requestId,
          }
        : {
            ...optionHeaders,
            "Request-Id": requestId,
          };
    var opt = (options ?? Options()).copyWith(
      headers: headers,
    );
    return post(path,
        options: opt,
        cancelToken: cancelToken,
        data: data,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        queryParameters: queryParameters);
  }

  Future<Response<T>> getWithRequestId<T>(String path, String requestId,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    var optionHeaders = options?.headers;
    var headers = optionHeaders == null
        ? {
            "Request-Id": requestId,
          }
        : {
            ...optionHeaders,
            "Request-Id": requestId,
          };
    var opt = (options ?? Options()).copyWith(
      headers: headers,
    );
    return get(path,
        options: opt,
        cancelToken: cancelToken,
        data: data,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters);
  }

  Future<Response<T>> putWithRequestId<T>(String path, String requestId,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) {
    var optionHeaders = options?.headers;
    var headers = optionHeaders == null
        ? {
            "Request-Id": requestId,
          }
        : {
            ...optionHeaders,
            "Request-Id": requestId,
          };
    var opt = (options ?? Options()).copyWith(
      headers: headers,
    );
    return put(path,
        options: opt,
        cancelToken: cancelToken,
        data: data,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        queryParameters: queryParameters);
  }
}
