import 'package:flutter/material.dart';
import 'package:common/widgets/custom_background_widget.dart';

import 'skelton.dart';

class TotalCard extends StatelessWidget {
  const TotalCard({super.key, required this.label});

  final Widget label;

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Row(
        children: [
          Expanded(
              child: Text('Total:',
                  style: Theme.of(context).textTheme.labelLarge)),
          const SizedBox(width: 10),
          DefaultTextStyle.merge(
              style: Theme.of(context).textTheme.titleMedium, child: label),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}

class SkeletonTotalCard extends StatelessWidget {
  const SkeletonTotalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Row(
        children: [
          Expanded(
              child: Text('Total:',
                  style: Theme.of(context).textTheme.labelLarge)),
          const SizedBox(width: 10),
          const Skelton(width: 75),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
