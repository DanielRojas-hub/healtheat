import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/services/restaurant/restaurant_bloc.dart';
import 'package:healtheat/common/widgets/skelton.dart';

class RestaurantDisplayName extends StatelessWidget {
  const RestaurantDisplayName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<RestaurantBloc, RestaurantState>(
        builder: (context, state) {
          if (state is RestaurantLoaded) {
            final restaurant = state.restaurant;
            return Text(restaurant.displayName.toString(),
                style: Theme.of(context).textTheme.headlineSmall);
          }
          if (state is RestaurantLoading) {
            return const Skelton(width: 150);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
