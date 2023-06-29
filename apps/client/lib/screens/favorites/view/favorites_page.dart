import 'package:common/controllers/controllers.dart';
import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../favorites.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<TabCubit>(
        create: (context) => TabCubit(tabList: favoritesTabList),
      ),
      BlocProvider<CategoryBloc>(
        create: (context) => CategoryBloc()..add(const StreamCategories()),
      ),
    ], child: const FavoritesView());
  }
}
