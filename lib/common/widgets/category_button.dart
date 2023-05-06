import 'package:flutter/material.dart';
import 'custom_icon_button.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    Key? key,
    required this.iconData,
    required this.label,
  }) : super(key: key);

  final IconData iconData;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          iconData: iconData,
          backgroundColor: Colors.grey[200],
          color: Colors.grey[500],
          iconSize: 40,
        ),
        const SizedBox(
          height: 5,
        ),
        DefaultTextStyle.merge(
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSecondaryContainer),
          child: label,
        ),
      ],
    );
  }
}
