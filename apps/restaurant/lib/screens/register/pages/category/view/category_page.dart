import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/register/pages/category/view/view.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<CuisineBloc>(
          create: (context) => CuisineBloc()..add(const StreamCuisines())),
      BlocProvider<MenuBloc>(
          create: (context) => MenuBloc()..add(const StreamMenus())),
      BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc()..add(const StreamCategories())),
    ], child: const CategoryView());
  }
}
