import 'package:common/services/food/food_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../about.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key, required this.restaurantId});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FoodBloc>(
          create: (context) => FoodBloc()..add(StreamFoods(restaurantId)),
        )
      ],
      child: AboutView(restaurantId: restaurantId),
    );
  }
}
