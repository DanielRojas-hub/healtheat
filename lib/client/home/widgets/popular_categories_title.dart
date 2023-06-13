import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/widgets/custom_label_button.dart';

class PopularCategoriesTitle extends StatelessWidget {
  const PopularCategoriesTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text('Popular Categories', style: Theme.of(context).textTheme.titleLarge),
      CustomLabelButton(
        label: Text('View all',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Theme.of(context).colorScheme.tertiary,
                )),
        suffix: Icons.keyboard_arrow_right,
        color: Theme.of(context).colorScheme.tertiary,
        backgroundColor: Colors.transparent,
        onTap: () => context.goNamed(RouteName.homeRestaurantFilter),
      ),
    ]);
  }
}
