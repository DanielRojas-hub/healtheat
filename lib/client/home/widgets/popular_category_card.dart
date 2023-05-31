import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/category_button.dart';

class PopularCategoryCard extends StatelessWidget {
  const PopularCategoryCard(
      {super.key, required this.label, required this.onTap});

  final Widget label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CategoryButton(
        iconData: Icons.lunch_dining_outlined,
        label: DefaultTextStyle.merge(
            style: Theme.of(context).textTheme.labelSmall, child: label),
        onTap: onTap);
  }
}
