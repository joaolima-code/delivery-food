import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'core/core.config.dart';
import 'core/core.module.dart';
import 'core/enums/environment.enum.dart';

void main() async {
  const String envValue = String.fromEnvironment('DEFINE_ENVORIMENT');

  final EnvironmentEnum env = EnvironmentEnumExtension.getByName(envValue);

  CoreConfig.instance.initialize(env);

  runZonedGuarded(() async {
    FlutterNativeSplash.preserve(
        widgetsBinding: WidgetsFlutterBinding.ensureInitialized());

    await CoreConfig.instance.initializeLibrary();
    runApp(const CoreModule());
  }, (Object error, StackTrace stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}
