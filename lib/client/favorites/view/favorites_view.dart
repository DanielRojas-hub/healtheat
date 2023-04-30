import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/card_food.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CardFood(),
    );
  }
}
