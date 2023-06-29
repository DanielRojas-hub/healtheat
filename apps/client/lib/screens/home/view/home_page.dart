import 'package:common/controllers/controllers.dart';
import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.categories, this.cuisines, this.menus})
      : super(key: key);
  final List<String>? categories;
  final List<String>? cuisines;
  final List<String>? menus;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabCubit>(
          create: (context) => TabCubit(tabList: homeTabList),
        ),
        BlocProvider<UserPreferenceBloc>(
          create: (context) => UserPreferenceBloc()
            ..add(UserBlocUserPreference(context.read<UserBloc>())),
        ),
        BlocProvider<RestaurantBloc>(
          create: (context) => RestaurantBloc()
            ..add(UserPreferenceBlocRestaurants(
                context.read<UserPreferenceBloc>(),
                categories: categories,
                cuisines: cuisines,
                menus: menus)),
        )
      ],
      child: HomeView(categories: categories, cuisines: cuisines, menus: menus),
    );
  }
}
