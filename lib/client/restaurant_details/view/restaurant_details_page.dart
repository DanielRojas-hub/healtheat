import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/controllers/tab/tab_cubit.dart';
import '../restaurant_details.dart';

class RestaurantDetailsPage extends StatelessWidget {
  const RestaurantDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<TabCubit>(
        create: (context) => TabCubit(tabList: restaurantDetailsTabList),
      ),
    ], child: const RestaurantDetailsView());
  }
}
