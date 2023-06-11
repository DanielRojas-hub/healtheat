import 'package:flutter/material.dart';
import 'package:common/utils/constants.dart';
import 'package:common/widgets/counter_widget.dart';
import 'package:common/widgets/image_container.dart';

import '../base_card.dart';
import '../skelton.dart';

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
      this.imageUrl});

  final String title;
  final String counter;
  final bool isCounter;
  final String suffix;
  final String? imageUrl;
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
              Text(title,
                  style: Theme.of(context).textTheme.titleSmall, maxLines: 1),
              if (isCounter) ...[
                const SizedBox(height: 5),
                CounterWidget(
                  label: Text(counter),
                  onIncrease: onIncrease,
                  onDecrease: onDecrease,
                )
              ] else ...[
                const SizedBox(height: 3),
                Text(counter, style: Theme.of(context).textTheme.titleSmall),
              ]
            ]),
          ),
          const SizedBox(width: 10),
          Text(suffix,
              style: isCounter
                  ? Theme.of(context).textTheme.labelLarge
                  : Theme.of(context).textTheme.titleMedium),
          const SizedBox(width: 10),
        ]),
      ),
    );
  }
}

class SkeletonCartCard extends StatelessWidget {
  const SkeletonCartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      borderRadius: BorderRadius.zero,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(children: [
          ImageContainer(
              width: 55,
              height: 55,
              borderRadius: BorderRadius.circular(Constants.radiusSmall)),
          const SizedBox(width: 15),
          const Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skelton(width: 125, height: 15),
                  SizedBox(height: 5),
                  Skelton(width: 75, height: 15),
                ]),
          ),
          const SizedBox(width: 10),
          const Skelton(width: 75),
          const SizedBox(width: 10),
        ]),
      ),
    );
  }
}
