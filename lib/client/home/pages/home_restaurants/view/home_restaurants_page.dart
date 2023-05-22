import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/client/home/pages/home_restaurants/view/home_restaurants_view.dart';
import 'package:healtheat/common/services/restaurant/restaurant_bloc.dart';

class HomeRestaurantsPage extends StatelessWidget {
  const HomeRestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RestaurantBloc>(
          create: (context) => RestaurantBloc()..add(const StreamRestaurants()),
        )
      ],
      child: const HomeRestaurantsView(),
    );
  }
}
