import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class DottedDivider extends StatelessWidget {
  const DottedDivider({super.key, this.padding});

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 15),
      color: Theme.of(context).cardColor,
      child: DottedLine(
        dashLength: 10,
        dashGapLength: 5,
        lineThickness: 2,
        dashColor: Colors.grey[300]!,
      ),
    );
  }
}
