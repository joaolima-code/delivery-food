import 'package:dio/dio.dart';

import '../bdLocal/domain/usecase/core.get.token.usecase.dart';
import '../core.config.dart';

class CoreNetworkDioInterceptor implements InterceptorsWrapper {
  CoreNetworkDioInterceptor();

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    return handler.reject(error);
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final String url = options.uri.toString();
    if (url.contains('maps.googleapis.com')) {
      options.queryParameters.addAll(
          <String, dynamic>{'key': 'AIzaSyB-FPqfUjjtZgN36TfC3J64FzH6hGI3GVA'});
    } else {
      final String? token =
          await CoreConfig.injector<CoreGetTokenUsecase>().call(null);
      if (token != null) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }

    return handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
