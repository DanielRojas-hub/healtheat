import 'package:flutter/material.dart';
import 'package:healtheat/common/controllers/tab/tab_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';

import '../favorites.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => TabCubit(tabList: favoritesTabList),
      ),
    ], child: const FavoritesView());
  }
}
