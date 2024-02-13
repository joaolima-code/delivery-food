import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/auth.injection.dart';
import '../../features/home/home.injection.dart';
import '../../features/splash/splash.injection.dart';
import '../bdLocal/core.bdLocal.injection.dart';
import '../core.config.dart';
import '../external/core.external.injection.dart';
import '../network/core.network.connection.dart';
import '../network/core.network.dio.client.dart';
import '../network/core.network.dio.interceptor.dart';

class DependencyInjection {
  DependencyInjection._internal();

  static final DependencyInjection _singleton = DependencyInjection._internal();
  static DependencyInjection get instance => _singleton;

  final GetIt injector = GetIt.instance;

  Future<void> initialize() async {
    injector.registerLazySingleton<Connectivity>(() => Connectivity());
    injector.registerLazySingleton<Dio>(() => CoreNetworkDioClient.instance
        .build(CoreConfig.instance.baseUrl, CoreNetworkDioInterceptor()));
    injector.registerLazySingleton<CoreNetworkConnectionInterface>(
        () => CoreNetworkConnection());

    injector.registerLazySingleton<FlutterSecureStorage>(
        () => const FlutterSecureStorage());

    await CoreExternalInjection.getInstance(injector).build();
    await CoreBdLocalInjection.getInstance(injector).build();

    await SplashInjection.getInstance(injector).build();
    await AuthInjection.getInstance(injector).build();
    await HomeInjection.getInstance(injector).build();
  }
}
