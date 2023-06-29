import 'package:common/controllers/controllers.dart';
import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';

import '../orders.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key, this.userId}) : super(key: key);
  final String? userId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabCubit>(
          create: (context) => TabCubit(tabList: homeTabList),
        ),
        BlocProvider<OrderBloc>(
            create: (context) =>
                OrderBloc()..add(StreamOrders(userId: userId))),
        BlocProvider<RestaurantBloc>(
          create: (context) => RestaurantBloc()..add(const StreamRestaurants()),
        )
      ],
      child: const HomeView(
          categories: ['categories'], cuisines: ['cuisines'], menus: ['menus']),
    );
  }
}
