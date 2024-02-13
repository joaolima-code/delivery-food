import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../firebase_options.dart';
import 'bdLocal/data/datasource/core.session.local.datasource.dart';
import 'enums/environment.enum.dart';
import 'external/domain/entity/core.locale.entity.dart';
import 'injection/dependency.injection.dart';

class CoreConfig {
  CoreConfig._internal();

  static final CoreConfig _singleton = CoreConfig._internal();
  static CoreConfig get instance => _singleton;

  static GetIt injector = DependencyInjection.instance.injector;

  late EnvironmentEnum environment;
  late String baseUrl;

  late CoreLocaleEntity localeUser;

  Future<void> initialize(EnvironmentEnum environment) async {
    this.environment = environment;

    baseUrl = environment.baseUrl;
  }

  Future<void> initializeLibrary() async {
    await _initFirebase();

    await Hive.initFlutter();
    await DependencyInjection.instance.initialize();
    await DependencyInjection.instance.injector
        .get<CoreSessionLocalDatasource>()
        .initialize();
  }

  Future<void> _initFirebase() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = (FlutterErrorDetails details) {
      FirebaseCrashlytics.instance.recordFlutterError(details);
    };
  }
}
