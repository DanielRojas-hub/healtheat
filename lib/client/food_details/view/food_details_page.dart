import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';

import '../food_detail.dart';

class FoodDetailsPage extends StatelessWidget {
  const FoodDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FoodBloc>(
          create: (context) => FoodBloc()
            ..add(const StreamFood(
                '28LecpHZyk81KUl6EsND', 'qqewld4omDi4w4qF9hPl')),
        ),
      ],
      child: const FoodDetails(),
    );
  }
}
