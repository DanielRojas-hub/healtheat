import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc()
            ..add(CartBlocCounter(
                context.read<CartBloc>(), restaurantId, foodId)),
        ),
        BlocProvider<FoodBloc>(
          create: (context) =>
              FoodBloc()..add(StreamFood(restaurantId, foodId)),
        ),
      ],
      child: FoodDetails(restaurantId: restaurantId, foodId: foodId),
    );
  }
}
