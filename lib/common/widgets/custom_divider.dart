import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider(
      {super.key, this.margin, this.color, this.height, this.backgroundColor});

  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? backgroundColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? Theme.of(context).cardColor,
      child: Container(
        height: height ?? 2,
        margin: margin ?? const EdgeInsets.symmetric(vertical: 15.0),
        color: color ?? Colors.grey[200],
      ),
    );
  }
}
