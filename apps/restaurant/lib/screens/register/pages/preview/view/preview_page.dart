import 'package:common/controllers/tab/tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../preview.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TabCubit>(
            create: (context) => TabCubit(tabList: restaurantDetailsTabList),
          ),
          // BlocProvider<RestaurantBloc>(
          //     create: (context) =>
          //         RestaurantBloc()..add(StreamRestaurant(restaurantId)))
        ],
        child: const PreviewView(
            // restaurantId: restaurantId, foodRouteName: foodRouteName
            ));
  }
}
