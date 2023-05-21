import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:healtheat/common/widgets/counter_widget.dart';

class FoodInfo extends StatelessWidget {
  const FoodInfo(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.price});
  final Widget title;
  final Widget price;
  final Widget subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            DefaultTextStyle.merge(
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                child: title),
            const SizedBox(height: 10),
            DefaultTextStyle.merge(
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                child: price),
            const SizedBox(height: 10),
            DefaultTextStyle.merge(
                style: Theme.of(context).textTheme.labelMedium,
                // overflow: TextOverflow.,
                // maxLines: 1,
                child: subtitle),
            const SizedBox(height: 10),
          ]),
          const SizedBox(height: 20),
          const CounterWidget(label: '1')
        ],
      ),
    );
  }
}
