import 'package:flutter/material.dart';

import '../all_restaurants.dart';

class AllRestaurantsPage extends StatelessWidget {
  const AllRestaurantsPage(
      {super.key, this.categories, this.cuisines, this.menus});

  final List<String>? categories;
  final List<String>? cuisines;
  final List<String>? menus;
  @override
  Widget build(BuildContext context) {
    return const AllRestaurantsView();
  }
}
