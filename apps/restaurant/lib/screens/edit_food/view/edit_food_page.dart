import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../edit_food.dart';

class EditFoodPage extends StatelessWidget {
  const EditFoodPage({
    super.key,
    required this.restaurantId,
    required this.foodId,
  });

  final String? restaurantId;
  final String? foodId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditFoodCubit(),
      child: EditFoodView(
        restaurantId: restaurantId,
        foodId: foodId,
      ),
    );
  }
}
