import 'package:client/router/route_name.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
