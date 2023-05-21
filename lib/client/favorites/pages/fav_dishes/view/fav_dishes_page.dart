import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/client/favorites/pages/fav_dishes/fav_dishes.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';

class FavDishesPage extends StatelessWidget {
  const FavDishesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<FoodBloc>(
        create: (context) =>
            FoodBloc()..add(const StreamFoods('28LecpHZyk81KUl6EsND')),
      ),
    ], child: const FavDishesView());
  }
}
