import 'package:flutter/material.dart';
import 'package:common/utils/constants.dart';

class Skelton extends StatelessWidget {
  const Skelton(
      {Key? key,
      this.width,
      this.height,
      this.backgroundColor,
      this.padding,
      this.borderRadius,
      this.image,
      this.shape,
      this.isCircle = false})
      : super(key: key);

  final double? width;
  final double? height;
  final bool isCircle;
  final Color? backgroundColor;
  final DecorationImage? image;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final BoxShape? shape;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 25,
      width: width,
      padding: padding ?? const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: backgroundColor ??
              Theme.of(context).colorScheme.tertiaryContainer,
          image: image,
          borderRadius: isCircle
              ? null
              : borderRadius ?? BorderRadius.circular(Constants.radiusMedium),
          shape: shape ?? BoxShape.rectangle),
    );
  }
}
