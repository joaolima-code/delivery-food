import 'package:flutter/material.dart';

extension CoreThemeStyle on ThemeData {
  SizedBox get smallSpacing => const SizedBox(height: 8);

  SizedBox get spacing => const SizedBox(height: 16);

  SizedBox get bigSpacing => const SizedBox(height: 20);

  SizedBox get bigXSpacing => const SizedBox(height: 24);

  SizedBox get veryBigSpacing => const SizedBox(height: 28);

  SizedBox get veryBigestSpacing => const SizedBox(height: 32);

  SizedBox get smallSpacingHorizontal => const SizedBox(width: 8);

  SizedBox get spacingHorizontal => const SizedBox(width: 16);

  SizedBox get bigSpacingHorizontal => const SizedBox(width: 20);

  SizedBox get bigerSpacingHorizontal => const SizedBox(width: 24);

  Container get divider => Container(
      height: 1, width: double.infinity, color: colorScheme.onSecondary);

  Container dividerHorizontal(double height) =>
      Container(height: height, width: 1, color: colorScheme.onSecondary);
}
