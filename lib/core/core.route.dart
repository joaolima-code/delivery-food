import 'package:flutter/material.dart';

import '../features/auth/presentation/initial/auth.initial.module.dart';
import '../features/auth/presentation/login/auth.login.module.dart';
import '../features/auth/presentation/register/auth.register.module.dart';
import '../features/home/timeline/home.timeline.module.dart';
import '../features/notFound/notFound.module.dart';
import '../features/restaurant/detail/restaurant.detail.module.dart';
import '../features/splash/presentation/splash.module.dart';

class CoreRoute {
  CoreRoute._internal();

  static final CoreRoute _singleton = CoreRoute._internal();

  static CoreRoute get instance => _singleton;

  Route<PageRoute<dynamic>> generateRoutes(RouteSettings settings) {
    Route<PageRoute<dynamic>> page;

    switch (settings.name) {
      case '/':
        page = _pageRoute(const SplashModule(), settings);
        break;
      case '/home':
        page = _pageRoute(const HomeTimelineModule(), settings);
        break;
      case '/auth':
        page = _pageRoute(const AuthInitialModule(), settings);
        break;
      case '/auth/login':
        page = _pageRoute(const AuthLoginModule(), settings);
        break;
      case '/auth/register':
        page = _pageRoute(const AuthRegisterModule(), settings);
        break;
      case '/restaurant':
        page = _pageRoute(const RestaurantDetailModule(), settings);
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
