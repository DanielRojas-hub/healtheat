import 'package:common/controllers/controllers.dart';
import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../orders.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabCubit>(
          create: (context) => TabCubit(tabList: homeTabList),
        ),
        BlocProvider<OrderBloc>(
            create: (context) =>
                OrderBloc()..add(UserBlocOrders(context.read<UserBloc>()))),
        BlocProvider<RestaurantBloc>(
          create: (context) => RestaurantBloc()..add(const StreamRestaurants()),
        ),
      ],
      child: const OrdersView(),
    );
  }
}
