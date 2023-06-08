import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FoodBloc>(
          create: (context) =>
              FoodBloc()..add(CartBlocFoods(context.read<CartBloc>())),
        ),
        BlocProvider<RestaurantBloc>(
          create: (context) => RestaurantBloc()
            ..add(CartBlocRestaurant(context.read<CartBloc>())),
        )
      ],
      child: const CartView(),
    );
  }
}
