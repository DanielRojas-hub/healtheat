import 'package:flutter/material.dart';

class TotalCard extends StatelessWidget {
  const TotalCard({super.key, required this.label});

  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      color: Colors.grey[50],
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
