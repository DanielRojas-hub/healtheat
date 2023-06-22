import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../search.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key, this.categories, this.cuisines, this.menus})
      : super(key: key);

  final List<String>? categories;
  final List<String>? cuisines;
  final List<String>? menus;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RestaurantBloc>(
          create: (context) => RestaurantBloc()
            ..add(UserPreferenceBlocRestaurants(
                context.read<UserPreferenceBloc>(),
                categories: categories,
                cuisines: cuisines,
                menus: menus)),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc()..add(const StreamCategories()),
        ),
        BlocProvider<CuisineBloc>(
          create: (context) => CuisineBloc()..add(const StreamCuisines()),
        ),
        BlocProvider<MenuBloc>(
          create: (context) => MenuBloc()..add(const StreamMenus()),
        ),
        BlocProvider<FilterBloc>(
            create: (context) => FilterBloc(
                categoryIds: categories, cuisineIds: cuisines, menuIds: menus)),
      ],
      child:
          SearchView(categories: categories, cuisines: cuisines, menus: menus),
    );
  }
}
