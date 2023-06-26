import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../menu.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key, required this.restaurantId}) : super(key: key);

  final String restaurantId;
  // final String foodRouteName;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FoodBloc>(
          create: (context) => FoodBloc()..add(StreamFoods(restaurantId)),
        )
      ],
      child: MenuView(restaurantId: restaurantId),
    );
  }
}
