// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:healtheat/common/services/food/food_bloc.dart';

import '../menu.dart';

class MenuPage extends StatelessWidget {
  const MenuPage(
      {Key? key, required this.restaurantId, required this.foodRouteName})
      : super(key: key);

  final String restaurantId;
  final String foodRouteName;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FoodBloc>(
          create: (context) => FoodBloc()..add(StreamFoods(restaurantId)),
        )
      ],
      child: MenuView(restaurantId: restaurantId, foodRouteName: foodRouteName),
    );
  }
}
