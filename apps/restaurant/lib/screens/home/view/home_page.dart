import 'package:common/controllers/controllers.dart';
import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.restaurantId}) : super(key: key);

  final String restaurantId;

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
      child: HomeView(restaurantId: restaurantId),
    );
  }
}
