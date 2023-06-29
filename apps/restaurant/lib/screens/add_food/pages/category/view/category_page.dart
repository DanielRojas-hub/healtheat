import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../category.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<MenuBloc>(
          create: (context) => MenuBloc()..add(const StreamMenus())),
      BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc()..add(const StreamCategories())),
      BlocProvider<FoodPreferenceBloc>(
        create: (context) =>
            FoodPreferenceBloc()..add(const StreamFoodPreferences()),
      )
    ], child: const CategoryView());
  }
}
