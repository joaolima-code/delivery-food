import 'package:flutter/material.dart';

class CoreNavigatorUtil {
  CoreNavigatorUtil._internal();

  static final CoreNavigatorUtil _singleton = CoreNavigatorUtil._internal();
  static CoreNavigatorUtil get instance => _singleton;

  void startPageWithNewBackStack({
    required BuildContext context,
    required String route,
    Object? arguments,
  }) {
    Navigator.pushReplacementNamed(context, route, arguments: arguments);
  }

  void pushAndRemoveStack({
    required BuildContext context,
    required String route,
    Object? arguments,
  }) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      route,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  void startPage({
    required BuildContext context,
    required String route,
    Object? arguments,
  }) {
    Navigator.pushNamed(
      context,
      route,
      arguments: arguments,
    );
  }
}
