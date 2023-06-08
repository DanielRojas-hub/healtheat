import 'package:common/controllers/controllers.dart';
import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../restaurant_details.dart';

class RestaurantDetailsPage extends StatelessWidget {
  const RestaurantDetailsPage(
      {Key? key, required this.restaurantId, required this.foodRouteName})
      : super(key: key);

  final String restaurantId;
  final String foodRouteName;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabCubit>(
          create: (context) => TabCubit(tabList: restaurantDetailsTabList),
        ),
        BlocProvider<RestaurantBloc>(
            create: (context) =>
                RestaurantBloc()..add(StreamRestaurant(restaurantId)))
      ],
      child: RestaurantDetailsView(
          restaurantId: restaurantId, foodRouteName: foodRouteName),
    );
  }
}
