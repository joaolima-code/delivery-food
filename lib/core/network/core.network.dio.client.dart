import 'package:dio/dio.dart';

class CoreNetworkDioClient {
  CoreNetworkDioClient._internal();

  static final CoreNetworkDioClient _singleton =
      CoreNetworkDioClient._internal();
  static CoreNetworkDioClient get instance => _singleton;

  Dio build(String baseUrl, InterceptorsWrapper dioInterceptor) {
    final Dio client = Dio()..options = BaseOptions(baseUrl: baseUrl);

    client.interceptors.add(dioInterceptor);

    return client;
  }
}
