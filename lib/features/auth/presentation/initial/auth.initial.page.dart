import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/util/core.navigator.util.dart';
import '../../../../shared/assets/images/image.path.dart';
import '../../../../shared/widgets/buttons/primary.button.widget.dart';
import '../login/auth.login.module.dart';

class AuthInitialPage extends StatefulWidget {
  const AuthInitialPage({super.key});

  @override
  State<AuthInitialPage> createState() => _AuthInitialPageState();
}

class _AuthInitialPageState extends State<AuthInitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImagePath.backgroundInitialPage),
                  fit: BoxFit.fitHeight,
                  opacity: 0.85)),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 48, vertical: 48),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      const CircleAvatar(
                          radius: 170,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                              child: Image(image: AssetImage(ImagePath.logo)))),
                      PrimaryButtonWidget(
                              text: 'Começar',
                              icon:
                                  Icon(Icons.arrow_forward_ios_rounded,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      size: 12),
                              onPressed: () => CoreNavigatorUtil.instance
                                  .startPage(
                                      context: context,
                                      route: AuthLoginModule.route))
                          .animate(
                              onPlay: (AnimationController controller) =>
                                  controller.repeat())
                          .shimmer(delay: 2.seconds, duration: 500.ms)
                    ])))
      ]),
    );
  }
}
