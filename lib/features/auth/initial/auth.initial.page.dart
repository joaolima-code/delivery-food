import 'package:flutter/material.dart';

import '../../../shared/assets/images/image.path.dart';

class AuthInitialPage extends StatefulWidget {
  const AuthInitialPage({super.key});

  @override
  State<AuthInitialPage> createState() => _AuthInitialPageState();
}

class _AuthInitialPageState extends State<AuthInitialPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImagePath.backgroundInitialPage),
                  fit: BoxFit.fitHeight)),
        ),
        Center(
          child: Column(
            children: <Widget>[],
          ),
        )
      ]),
    );
  }
}
