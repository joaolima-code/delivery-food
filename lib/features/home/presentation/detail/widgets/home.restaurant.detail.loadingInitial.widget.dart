import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../../../../../core/theme/core.theme.style.dart';

class HomeRestaurantDetailLoadingInitialWidget extends StatelessWidget {
  const HomeRestaurantDetailLoadingInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SingleChildScrollView(
        child: Stack(children: <Widget>[
      Opacity(
          opacity: 0.80,
          child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 450),
              child: Container(
                  height: 300,
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.grey.shade300))),
      Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              width: MediaQuery.of(context).size.width,
              constraints: BoxConstraints(
                  minHeight: MediaQuery.sizeOf(context).height * 0.8),
              margin: const EdgeInsets.only(top: 180),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                  color: theme.colorScheme.onPrimary,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(24))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(children: <Widget>[
                              const SkeletonAvatar(
                                style: SkeletonAvatarStyle(
                                    height: 50,
                                    width: 50,
                                    shape: BoxShape.circle),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: theme.dividerHorizontal(20)),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SkeletonLine(
                                        style: SkeletonLineStyle(
                                            width: 120,
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    const SizedBox(height: 4),
                                    SkeletonLine(
                                        style: SkeletonLineStyle(
                                            height: 12,
                                            width: 70,
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    const SizedBox(height: 2),
                                    SkeletonLine(
                                        style: SkeletonLineStyle(
                                            height: 12,
                                            width: 50,
                                            borderRadius:
                                                BorderRadius.circular(8)))
                                  ])
                            ]),
                            Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  SkeletonLine(
                                      style: SkeletonLineStyle(
                                          height: 24,
                                          width: 24,
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  const SizedBox(width: 4),
                                  SkeletonLine(
                                      style: SkeletonLineStyle(
                                          height: 16,
                                          width: 16,
                                          borderRadius:
                                              BorderRadius.circular(6)))
                                ]),
                          ]),
                      theme.bigSpacing,
                      SkeletonLine(
                          style: SkeletonLineStyle(
                              height: 200,
                              borderRadius: BorderRadius.circular(16)))
                    ]),
                    theme.bigSpacing,
                    SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 24,
                            width: 100,
                            borderRadius: BorderRadius.circular(16))),
                    theme.smallSpacing,
                    SizedBox(
                        height: 170,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 170,
                                      width: 170,
                                      borderRadius: BorderRadius.circular(16))),
                              theme.spacingHorizontal,
                              SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 170,
                                      width: 170,
                                      borderRadius: BorderRadius.circular(16))),
                              theme.spacingHorizontal,
                              SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 170,
                                      width: 170,
                                      borderRadius: BorderRadius.circular(16)))
                            ])),
                    theme.bigSpacing,
                    SkeletonLine(
                        style: SkeletonLineStyle(
                            height: 24,
                            width: 100,
                            borderRadius: BorderRadius.circular(16))),
                    theme.smallSpacing,
                    SizedBox(
                        height: 170,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 170,
                                      width: 170,
                                      borderRadius: BorderRadius.circular(16))),
                              theme.spacingHorizontal,
                              SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 170,
                                      width: 170,
                                      borderRadius: BorderRadius.circular(16))),
                              theme.spacingHorizontal,
                              SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 170,
                                      width: 170,
                                      borderRadius: BorderRadius.circular(16)))
                            ])),
                  ]))),
    ]));
  }
}
