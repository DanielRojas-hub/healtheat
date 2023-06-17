import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../add_food.dart';

class AddFoodPage extends StatelessWidget {
  const AddFoodPage({super.key, required this.restaurantId});
  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddFoodCubit(),
      child: AddFoodView(
        restaurantId: restaurantId,
      ),
    );
  }
}
