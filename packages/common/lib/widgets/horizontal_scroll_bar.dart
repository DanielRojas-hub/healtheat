import 'package:flutter/material.dart';
import 'package:common/utils/constants.dart';

class HorizontalScrollBar extends StatelessWidget {
  const HorizontalScrollBar({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        width: 75,
        height: 3.5,
        decoration: BoxDecoration(
            color: Theme.of(context).disabledColor,
            borderRadius: BorderRadius.circular(Constants.radiusInfinite)),
      ),
    );
  }
}
