import 'package:common/controllers/controllers.dart';
import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, this.categoryIds, this.cuisineIds, this.menuIds})
      : super(key: key);

  final List<String>? categoryIds;
  final List<String>? cuisineIds;
  final List<String>? menuIds;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TabCubit>(
          create: (context) => TabCubit(tabList: homeTabList),
        ),
        BlocProvider<RestaurantBloc>(
          create: (context) => RestaurantBloc()
            ..add(UserPreferenceBlocRestaurants(
                context.read<UserPreferenceBloc>(),
                categoryIds: categoryIds,
                cuisineIds: cuisineIds,
                menuIds: menuIds)),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc()..add(const StreamCategories()),
        ),
      ],
      child: HomeView(
          categoryIds: categoryIds, cuisineIds: cuisineIds, menuIds: menuIds),
    );
  }
}
