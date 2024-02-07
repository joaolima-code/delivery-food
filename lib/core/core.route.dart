import 'package:flutter/material.dart';

import '../features/auth/initial/auth.initial.module.dart';
import '../features/home/home.module.dart';
import '../features/notFound/notFound.module.dart';
import '../features/splash/presentation/splash.page.dart';

class CoreRoute {
  CoreRoute._internal();

  static final CoreRoute _singleton = CoreRoute._internal();

  static CoreRoute get instance => _singleton;

  Route<PageRoute<dynamic>> generateRoutes(RouteSettings settings) {
    Route<PageRoute<dynamic>> page;

    switch (settings.name) {
      case '/':
        page = _pageRoute(const SplashPage(), settings);
        break;
      case '/home':
        page = _pageRoute(const HomeModule(), settings);
        break;
      case '/auth':
        page = _pageRoute(const AuthInitialModule(), settings);
        break;
      default:
        page = _pageRoute(const NotFoundModule(), settings);
    }

    return page;
  }

  Route<PageRoute<dynamic>> _pageRoute(Widget widget, RouteSettings settings,
      {bool fullscreenDialog = false}) {
    return MaterialPageRoute<PageRoute<dynamic>>(
      builder: (BuildContext context) => widget,
      settings: settings,
      fullscreenDialog: fullscreenDialog,
    );
  }
}
