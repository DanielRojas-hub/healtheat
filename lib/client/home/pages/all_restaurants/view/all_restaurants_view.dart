import 'package:flutter/material.dart';

import '../all_restaurants.dart';

class AllRestaurantsView extends StatelessWidget {
  const AllRestaurantsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const AllRestaurantList(),
    );
  }
}
