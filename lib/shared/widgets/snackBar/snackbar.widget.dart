import 'package:flutter/material.dart';

enum SnackBarType { success, error, warning }

class SnackBarWidget {
  SnackBarWidget({
    required this.context,
    required this.text,
    this.type,
  });

  factory SnackBarWidget.of(BuildContext context, String text,
      {SnackBarType? type}) {
    return SnackBarWidget(context: context, text: text, type: type);
  }

  final String text;
  final BuildContext context;
  final SnackBarType? type;

  void show() {
    late Color? color;
    const Color fontColor = Colors.white;

    switch (type) {
      case SnackBarType.success:
        color = const Color(0xFF008A22);
        break;
      case SnackBarType.error:
        color = const Color(0xFFB92828);
        break;
      case SnackBarType.warning:
        color = const Color(0xFFFD7929);
        break;
      case null:
        color = null;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text(text, style: const TextStyle(color: fontColor)),
        backgroundColor: color));
  }
}
