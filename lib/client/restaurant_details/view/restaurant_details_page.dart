import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/controllers/tab/tab_cubit.dart';
import 'package:healtheat/common/services/restaurant/restaurant_bloc.dart';
import '../restaurant_details.dart';

class RestaurantDetailsPage extends StatelessWidget {
  const RestaurantDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<TabCubit>(
        create: (context) => TabCubit(tabList: restaurantDetailsTabList),
      ),
      BlocProvider<RestaurantBloc>(
          create: (context) => RestaurantBloc()
            ..add(const StreamRestaurant('28LecpHZyk81KUl6EsND')))
    ], child: const RestaurantDetailsView());
  }
}
