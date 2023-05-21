import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/base_card.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key, required this.price});

  final Widget price;
  @override
  Widget build(BuildContext context) {
    return BaseCard(
      // elevation: 60,
      // backgroundColor: Colors.amber,
      borderRadius: BorderRadius.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: [
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total price: ',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                DefaultTextStyle.merge(
                    style: Theme.of(context).textTheme.titleLarge, child: price)
              ]),
          const SizedBox(width: 70),
          Expanded(
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Add to cart')))
        ]),
      ),
    );
  }
}
