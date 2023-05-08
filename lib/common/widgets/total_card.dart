import 'package:flutter/material.dart';

class TotalCard extends StatelessWidget {
  const TotalCard({super.key, required this.label});

  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: Row(
        children: [
          Expanded(
              child: Text('Total:',
                  style: Theme.of(context).textTheme.labelLarge)),
          const SizedBox(width: 10),
          DefaultTextStyle.merge(
              style: Theme.of(context).textTheme.titleMedium, child: label),
        ],
      ),
    );
  }
}
