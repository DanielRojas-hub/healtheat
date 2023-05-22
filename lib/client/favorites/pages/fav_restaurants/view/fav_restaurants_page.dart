import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/services/restaurant/restaurant_bloc.dart';

import '../fav_restaurants.dart';

class FavRestaurantsPage extends StatelessWidget {
  const FavRestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<RestaurantBloc>(
        create: (context) => RestaurantBloc()..add(const StreamRestaurants()),
      ),
    ], child: const FavRestaurantsView());
  }
}
