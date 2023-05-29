import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {Key? key,
      required this.imageUrl,
      this.borderRadius,
      this.height,
      this.isCircle,
      this.width})
      : super(key: key);

  final String? imageUrl;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final bool? isCircle;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
