import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'base_card.dart';

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({Key? key, required this.onTap}) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      elevation: 0,
      onTap: onTap,
      borderRadius: BorderRadius.circular(Constants.radiusSmall),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            Text("View all", style: Theme.of(context).textTheme.labelMedium),
            Icon(Icons.keyboard_arrow_right,
                color: Theme.of(context).colorScheme.tertiary),
          ],
        ),
      ),
    );
  }
}
