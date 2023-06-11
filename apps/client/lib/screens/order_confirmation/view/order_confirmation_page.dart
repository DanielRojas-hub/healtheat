import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../order_confirmation.dart';

class OrderConfirmationPage extends StatelessWidget {
  const OrderConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<RestaurantBloc>(
        create: (context) =>
            RestaurantBloc()..add(CartBlocRestaurant(context.read<CartBloc>())),
      ),
      BlocProvider<FoodBloc>(
        create: (context) =>
            FoodBloc()..add(CartBlocFoods(context.read<CartBloc>())),
      )
    ], child: const OrderConfirmationView());
  }
}
