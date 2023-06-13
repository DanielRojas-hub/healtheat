import 'package:flutter/material.dart';

import '../restaurants.dart';

class RestaurantsView extends StatelessWidget {
  const RestaurantsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const RestaurantList(),
    );
  }
}
