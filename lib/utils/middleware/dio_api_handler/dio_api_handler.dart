import 'package:dio/dio.dart';
import 'package:social_media_app/utils/middleware/shared_data_handler/shared_data_key.dart';

import '../../../main.dart';

Dio dio = Dio();

Dio dioApiCall() {
  dio.interceptors.add(InterceptorsWrapper(onRequest:
      (RequestOptions options, RequestInterceptorHandler handler) async {
    String token =
        await sharedDataHandler.getSharedData(key: SharedDataKey.token);
    if (token != "") {
      options.headers["Authorization"] = "Bearer $token";
    }
    return handler.next(options);
  }, onResponse: (Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }, onError: (DioException exception, ErrorInterceptorHandler handler) {
    return handler.next(exception);
  }));
  return dio;
}
