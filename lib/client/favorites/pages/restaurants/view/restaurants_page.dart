import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/services/restaurant/restaurant_bloc.dart';

import '../restaurants.dart';

class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<RestaurantBloc>(
        create: (context) => RestaurantBloc()..add(const StreamRestaurants()),
      ),
    ], child: const RestaurantsView());
  }
}
