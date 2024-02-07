import 'package:flutter/material.dart';

import '../features/notFound/notFound.module.dart';
import 'core.route.dart';
import 'theme/core.theme.dart';

class CoreModule extends StatelessWidget {
  const CoreModule() : super(key: const Key('CoreModule'));

  @override
  Widget build(BuildContext context) => MaterialApp(
        key: const Key('MaterialApp'),
        theme: CoreTheme.themeDefault,
        themeMode: ThemeMode.light,
        title: 'Delivery-food',
        debugShowCheckedModeBanner: false,
        initialRoute: '/auth',
        onGenerateRoute: (RouteSettings settings) =>
            CoreRoute.instance.generateRoutes(settings),
        onUnknownRoute: (RouteSettings settings) =>
            MaterialPageRoute<PageRoute<dynamic>>(
                builder: (BuildContext context) => const NotFoundModule()),
      );
}
