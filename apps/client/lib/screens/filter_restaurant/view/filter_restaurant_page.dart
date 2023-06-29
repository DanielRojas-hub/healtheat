import 'package:flutter/material.dart';
import '../filter_restaurant.dart';
import 'package:common/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterRestaurantPage extends StatelessWidget {
  const FilterRestaurantPage(
      {super.key, this.categoryIds, this.cuisineIds, this.menuIds});
  final List<String>? categoryIds;
  final List<String>? cuisineIds;
  final List<String>? menuIds;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
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
    ], child: const FilterRestaurantView());
  }
}
