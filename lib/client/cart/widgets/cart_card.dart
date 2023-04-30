import 'package:flutter/material.dart';
// import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/counter_widget.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      color: Colors.grey[50],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            /* Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(Constants.radiusSmall)),
            ), */
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sakura Set',
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 5),
                  CounterWidget(label: '1', onDecrease: () {})
                ],
              ),
            ),
            const SizedBox(width: 10),
            Text('\$23.64', style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
