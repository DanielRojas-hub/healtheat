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
                style: Theme.of(context).textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                child: title),
            DefaultTextStyle.merge(
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).primaryColor),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                child: price),
            const SizedBox(height: 15),
            DefaultTextStyle.merge(
                style: Theme.of(context).textTheme.labelLarge,
                // overflow: TextOverflow.,
                // maxLines: 1,
                child: subtitle),
          ]),
          const SizedBox(height: 50),
          const CounterWidget(
            label: '1',
            iconSize: 30,
            fontSize: 22,
            labelPadding: EdgeInsets.symmetric(horizontal: 15.0),
            iconPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          )
        ],
      ),
    );
  }
}
