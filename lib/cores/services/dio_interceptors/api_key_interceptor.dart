import 'package:siren/cores/env.dart';
import 'package:dio/dio.dart';

class ApiKeyInterceptor extends Interceptor {
  final Env _env;

  const ApiKeyInterceptor({required Env env}) : _env = env;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    var headers = options.headers;
    headers.addAll({"app-id": _env.apiKey});
    return handler.next(options.copyWith(headers: headers));
  }
}
