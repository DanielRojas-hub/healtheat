import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../all_restaurants.dart';

class AllRestaurantsPage extends StatelessWidget {
  const AllRestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RestaurantBloc>(
          create: (context) => RestaurantBloc()
            ..add(UserPreferenceBlocRestaurants(
                context.read<UserPreferenceBloc>())),
        )
      ],
      child: const AllRestaurantsView(),
    );
  }
}
