import 'package:flutter/material.dart';

class ImageNetworkWidget extends StatelessWidget {
  const ImageNetworkWidget({
    required this.urlImage,
    this.boxConstraints,
    this.width,
    this.height,
    this.padding,
    this.boxFit,
    super.key,
  });

  final EdgeInsetsGeometry? padding;
  final String urlImage;
  final BoxConstraints? boxConstraints;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Container(
            constraints: boxConstraints,
            width: width,
            height: height,
            color: Theme.of(context).colorScheme.secondary,
            child: checkImage(context)));
  }

  Widget checkImage(BuildContext context) {
    final double heightError = height ?? 20;

    if (Uri.parse(urlImage).isAbsolute &&
        Uri.tryParse(urlImage)!.hasAbsolutePath) {
      return Image.network(
        urlImage,
        fit: boxFit ?? BoxFit.cover,
        filterQuality: FilterQuality.none,
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return errorBuildImage(heightError, context);
        },
        loadingBuilder:
            (BuildContext context, Widget child, ImageChunkEvent? loading) {
          if (loading == null) {
            return child;
          }
          return Center(
              child: SizedBox(
                  height: height != null ? height! * 0.6 : 20,
                  width: height != null ? height! * 0.6 : 20,
                  child: const CircularProgressIndicator()));
        },
      );
    }
    return errorBuildImage(heightError, context);
  }

  Widget errorBuildImage(double height, BuildContext context) {
    return Center(
        child: Icon(Icons.error_outline,
            color: Theme.of(context).colorScheme.onPrimary,
            size: height * 0.6));
  }
}
