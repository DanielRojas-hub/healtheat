import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.margin, this.color, this.height});

  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 2,
      margin: margin ?? const EdgeInsets.symmetric(vertical: 15.0),
      color: color ?? Theme.of(context).colorScheme.tertiaryContainer,
    );
  }
}
