import 'package:flutter/material.dart';
import 'package:common/utils/constants.dart';

import 'base_card.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget(
      {super.key,
      required this.label,
      this.onIncrease,
      this.onDecrease,
      this.iconSize,
      this.fontSize,
      this.iconPadding,
      this.labelPadding});

  final Widget label;
  final double? iconSize;
  final double? fontSize;
  final EdgeInsetsGeometry? iconPadding;
  final EdgeInsetsGeometry? labelPadding;

  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: BaseCard(
        elevation: 2,
        borderRadius: BorderRadius.circular(Constants.radiusInfinite),
        child: Row(children: [
          BaseCard(
            onTap: onDecrease,
            borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(Constants.radiusInfinite)),
            elevation: 0,
            child: Padding(
              padding: iconPadding ??
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
              child: Icon(Icons.remove,
                  size: iconSize ?? 16,
                  color: onDecrease == null
                      ? Theme.of(context).disabledColor
                      : null),
            ),
          ),
          Container(
            padding:
                labelPadding ?? const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              border: Border.symmetric(
                  vertical: BorderSide(
                      color: Theme.of(context).colorScheme.tertiaryContainer)),
            ),
            child: DefaultTextStyle.merge(
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: fontSize,
                    ),
                child: label),
          ),
          BaseCard(
            onTap: onIncrease,
            borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(Constants.radiusInfinite)),
            elevation: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
              child: Icon(Icons.add,
                  size: iconSize ?? 16,
                  color: onIncrease == null
                      ? Theme.of(context).disabledColor
                      : null),
            ),
          ),
        ]),
      ),
    );
  }
}
