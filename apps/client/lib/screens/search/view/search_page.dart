import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../search.dart';

class SearchPage extends StatelessWidget {
  const SearchPage(
      {Key? key,
      this.categoryIds,
      this.cuisineIds,
      this.menuIds,
      this.searchInput})
      : super(key: key);

  final List<String>? categoryIds;
  final List<String>? cuisineIds;
  final List<String>? menuIds;
  final String? searchInput;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
        BlocProvider<CuisineBloc>(
          create: (context) => CuisineBloc()..add(const StreamCuisines()),
        ),
        BlocProvider<MenuBloc>(
          create: (context) => MenuBloc()..add(const StreamMenus()),
        ),
        BlocProvider<FilterBloc>(
            create: (context) => FilterBloc(
                categoryIds: categoryIds,
                cuisineIds: cuisineIds,
                menuIds: menuIds)),
      ],
      child: SearchView(
          categoryIds: categoryIds, cuisineIds: cuisineIds, menuIds: menuIds),
    );
  }
}
