import 'package:flutter/material.dart';
import 'base_card.dart';

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({
    Key? key,
    required this.iconData,
    this.iconSize,
  }) : super(key: key);

  final IconData iconData;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      elevation: 0,
      child: Row(
        children: [
          DefaultTextStyle.merge(
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer),
            child: const Text("View all"),
          ),
          Icon(
            iconData,
            size: iconSize,
            color: Theme.of(context).colorScheme.onSecondaryContainer,
          ),
        ],
      ),
    );
  }
}
