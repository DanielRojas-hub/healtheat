import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';

import 'base_card.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget(
      {super.key, required this.label, this.onIncrease, this.onDecrease});

  final String label;

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
            onTap: onIncrease,
            borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(Constants.radiusInfinite)),
            elevation: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
              child: Icon(Icons.remove,
                  size: 16,
                  color: onDecrease == null
                      ? Theme.of(context).disabledColor
                      : null),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              border: Border.symmetric(
                  vertical: BorderSide(
                      color: Theme.of(context).colorScheme.secondaryContainer)),
            ),
            child: Text(label, style: Theme.of(context).textTheme.titleSmall),
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
                  size: 16,
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
