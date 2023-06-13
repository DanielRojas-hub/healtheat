import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/client/home/pages/open_now/view/open_now_view.dart';
import 'package:healtheat/common/services/restaurant/restaurant_bloc.dart';
import 'package:healtheat/common/services/user_preference/user_preference_bloc.dart';

class OpenNowPage extends StatelessWidget {
  const OpenNowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RestaurantBloc>(
          create: (context) => RestaurantBloc()
            ..add(UserPreferenceBlocRestaurants(
                context.read<UserPreferenceBloc>())),
        )
      ],
      child: const OpenNowView(),
    );
  }
}
