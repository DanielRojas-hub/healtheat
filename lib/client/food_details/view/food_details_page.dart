// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:healtheat/common/services/food/food_bloc.dart';

import '../food_detail.dart';

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage({
    Key? key,
    required this.restaurantId,
    required this.foodId,
  }) : super(key: key);

  final String restaurantId;
  final String foodId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FoodBloc>(
          create: (context) =>
              FoodBloc()..add(StreamFood(restaurantId, foodId)),
        ),
      ],
      child: FoodDetails(restaurantId: restaurantId, foodId: foodId),
    );
  }
}
