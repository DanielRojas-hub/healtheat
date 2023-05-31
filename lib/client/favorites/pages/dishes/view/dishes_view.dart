import 'package:flutter/material.dart';

import '../dishes.dart';

class DishesView extends StatelessWidget {
  const DishesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const DishesList(),
    );
  }
}
