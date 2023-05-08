import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer(
      {Key? key,
      required this.url,
      this.borderRadius,
      this.height,
      this.isCircle})
      : super(key: key);

  final String url;
  final double? height;
  final BorderRadius? borderRadius;
  final bool? isCircle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
          borderRadius: isCircle ?? false
              ? null
              : borderRadius ??
                  const BorderRadius.vertical(
                      top: Radius.circular(Constants.radiusMedium)),
          shape: isCircle ?? false ? BoxShape.circle : BoxShape.rectangle),
    );
  }
}
