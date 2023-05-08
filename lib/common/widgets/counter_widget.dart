import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';

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
      child: Material(
        elevation: 2,
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.radiusInfinite)),
        child: Row(
          children: [
            GestureDetector(
              onTap: onDecrease,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                child: Icon(Icons.remove,
                    size: 16,
                    color: onDecrease == null
                        ? Theme.of(context).disabledColor
                        : null),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.symmetric(
                    vertical: BorderSide(color: Colors.grey[200]!)),
              ),
              child: Text(label, style: Theme.of(context).textTheme.titleSmall),
            ),
            GestureDetector(
              onTap: onIncrease,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                child: Icon(Icons.add,
                    size: 16,
                    color: onIncrease == null
                        ? Theme.of(context).disabledColor
                        : null),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
