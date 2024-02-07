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
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImagePath.backgroundInitialPage),
                  fit: BoxFit.fitHeight,
                  opacity: 0.85)),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipOval(
                        child: Image(
                            height: 500, image: AssetImage(ImagePath.logo)))),
                SizedBox(height: 24),
                TextButton(onPressed: () {}, child: Text('Proximo'))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
