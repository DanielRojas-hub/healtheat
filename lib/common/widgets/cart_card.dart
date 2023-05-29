import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/counter_widget.dart';
import 'package:healtheat/common/widgets/image_container.dart';

import 'base_card.dart';

class CartCard extends StatelessWidget {
  const CartCard(
      {super.key,
      required this.title,
      required this.counter,
      this.isCounter = false,
      required this.suffix,
      this.onIncrease,
      this.onDecrease,
      this.onTap,
      required this.imageUrl});

  final Widget title;
  final Widget counter;
  final bool isCounter;
  final Widget suffix;
  final String imageUrl;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: onTap,
      borderRadius: BorderRadius.zero,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(children: [
          ImageContainer(
            imageUrl: imageUrl,
            borderRadius: BorderRadius.circular(Constants.radiusSmall),
            width: 55,
            height: 55,
          ),
          const SizedBox(width: 15),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              DefaultTextStyle.merge(
                  style: Theme.of(context).textTheme.titleSmall,
                  maxLines: 1,
                  child: title),
              if (isCounter) ...[
                const SizedBox(height: 5),
                CounterWidget(
                  label: counter,
                  onIncrease: onIncrease,
                  onDecrease: onDecrease,
                )
              ] else ...[
                const SizedBox(height: 3),
                DefaultTextStyle.merge(
                    style: Theme.of(context).textTheme.titleSmall,
                    child: counter),
              ]
            ]),
          ),
          const SizedBox(width: 10),
          DefaultTextStyle.merge(
              style: isCounter
                  ? Theme.of(context).textTheme.labelLarge
                  : Theme.of(context).textTheme.titleMedium,
              child: suffix),
          if (isCounter) const SizedBox(width: 10),
        ]),
      ),
    );
  }
}
