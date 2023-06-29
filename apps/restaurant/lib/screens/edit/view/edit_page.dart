import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/register/register.dart';

import 'view.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key, required this.restaurantId});
  final String restaurantId;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<RegisterCubit>(
        create: (context) => RegisterCubit(),
      ),
      BlocProvider<RestaurantBloc>(
          create: (context) =>
              RestaurantBloc()..add(GetRestaurant(restaurantId)))
    ], child: const EditView());
  }
}
