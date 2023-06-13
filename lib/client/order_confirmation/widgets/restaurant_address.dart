import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/services/restaurant/restaurant_bloc.dart';
import 'package:healtheat/common/widgets/cards/restaurant_address_card.dart';

class RestaurantAddress extends StatelessWidget {
  const RestaurantAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoaded) {
          final restaurant = state.restaurant;
          return RestaurantAddressCard(
            title: restaurant.displayName.toString(),
            subtitle: restaurant.address.toString(),
          );
        }
        if (state is RestaurantLoading) {
          return const SkeletonRestaurantAddressCard();
        }
        return const SizedBox();
      },
    );
  }
}
