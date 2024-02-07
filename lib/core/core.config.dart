import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'enums/environment.enum.dart';
import 'injection/dependency.injection.dart';

class CoreConfig {
  CoreConfig._internal();

  static final CoreConfig _singleton = CoreConfig._internal();
  static CoreConfig get instance => _singleton;

  static GetIt injector = DependencyInjection.instance.injector;

  late EnvironmentEnum environment;
  late String baseUrl;

  Future<void> initialize(EnvironmentEnum environment) async {
    this.environment = environment;

    baseUrl = environment.baseUrl;
  }

  Future<void> initializeLibrary() async {
    // await Hive.initFlutter();

    // await _initFirebase();

    await DependencyInjection.instance.initialize();
  }

  Future<void> _initFirebase() async {
    // await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform);

    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = (FlutterErrorDetails details) {
      FirebaseCrashlytics.instance.recordFlutterError(details);
    };
  }
}
