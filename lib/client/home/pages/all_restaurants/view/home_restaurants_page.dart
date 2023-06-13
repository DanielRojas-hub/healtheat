import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/client/home/pages/all_restaurants/view/all_restaurants_view.dart';
import 'package:healtheat/common/services/restaurant/restaurant_bloc.dart';
import 'package:healtheat/common/services/user_preference/user_preference_bloc.dart';

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
