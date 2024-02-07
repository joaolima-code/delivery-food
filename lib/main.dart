import 'dart:async';

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
    debugPrint(error.toString());
    debugPrint(stack.toString());
  });
}
