import 'package:dio/dio.dart';

class CoreNetworkDioInterceptor implements InterceptorsWrapper {
  CoreNetworkDioInterceptor();

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    return handler.reject(error);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // todo: implement check auth token
    // if(token != null && token.isNotEmpty) {
    //     options.headers.addAll(<String, Object?>('Authorization': 'Bearer $token'))
    // }
    return handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
