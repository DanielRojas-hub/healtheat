import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';

import 'skelton.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {Key? key,
      this.imageUrl,
      this.borderRadius,
      this.height,
      this.isCircle = false,
      this.width,
      this.backgroundColor})
      : super(key: key);

  final String? imageUrl;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return Skelton(
      height: height,
      width: width,
      isCircle: isCircle,
      image: imageUrl != null
          ? DecorationImage(image: NetworkImage(imageUrl!), fit: BoxFit.cover)
          : null,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius ??
          const BorderRadius.vertical(
              top: Radius.circular(Constants.radiusMedium)),
      shape: isCircle ? BoxShape.circle : null,
    );
  }
}
