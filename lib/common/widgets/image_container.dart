import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';

import 'skelton.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {Key? key,
      this.imageUrl,
      this.borderRadius,
      this.height,
      this.isCircle,
      this.width,
      this.backgroundColor})
      : super(key: key);

  final String? imageUrl;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final bool? isCircle;

  @override
  Widget build(BuildContext context) {
    return Skelton(
      height: height,
      width: width,
      image: imageUrl != null
          ? DecorationImage(image: NetworkImage(imageUrl!), fit: BoxFit.cover)
          : null,
      backgroundColor: backgroundColor,
      borderRadius: isCircle ?? false
          ? null
          : borderRadius ??
              const BorderRadius.vertical(
                  top: Radius.circular(Constants.radiusMedium)),
      shape: isCircle ?? false ? BoxShape.circle : BoxShape.rectangle,
    )

        /* Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          image: imageUrl != null
              ? DecorationImage(
                  image: NetworkImage(imageUrl!), fit: BoxFit.cover)
              : null,
          borderRadius: isCircle ?? false
              ? null
              : borderRadius ??
                  const BorderRadius.vertical(
                      top: Radius.circular(Constants.radiusMedium)),
          shape: isCircle ?? false ? BoxShape.circle : BoxShape.rectangle),
    ) */
        ;
  }
}
