import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dishes.dart';

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
