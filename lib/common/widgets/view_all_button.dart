import 'package:flutter/material.dart';
import 'base_card.dart';

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      elevation: 0,
      child: Row(
        children: [
          Text("View all", style: Theme.of(context).textTheme.labelMedium),
          Icon(Icons.keyboard_arrow_right,
              color: Theme.of(context).colorScheme.tertiary),
        ],
      ),
    );
  }
}
