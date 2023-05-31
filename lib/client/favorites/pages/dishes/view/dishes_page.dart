import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/client/favorites/pages/dishes/dishes.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';

class DishesPage extends StatelessWidget {
  const DishesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<FoodBloc>(
        create: (context) =>
            FoodBloc()..add(const StreamFoods('28LecpHZyk81KUl6EsND')),
      ),
    ], child: const DishesView());
  }
}
