import 'package:flutter/material.dart';

import '../menu.dart';

class MenuView extends StatelessWidget {
  const MenuView(
      {Key? key, required this.restaurantId, required this.foodRouteName})
      : super(key: key);

  final String restaurantId;
  final String foodRouteName;

  @override
  Widget build(BuildContext context) {
    return FoodList(
      restaurantId: restaurantId,
      foodRouteName: foodRouteName,
    );
  }
}