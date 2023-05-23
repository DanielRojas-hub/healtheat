import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/services/restaurant/restaurant_bloc.dart';
import 'package:healtheat/common/widgets/base_card.dart';

class RestaurantAddress extends StatelessWidget {
  const RestaurantAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoaded) {
          final restaurant = state.restaurant;

          return BaseCard(
            elevation: 0,
            borderRadius: BorderRadius.zero,
            child: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.lightGreenAccent),
                  padding: const EdgeInsets.all(10.0),
                  child: const Icon(Icons.restaurant, size: 20),
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.displayName.toString(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      restaurant.address.toString(),
                      style: Theme.of(context).textTheme.labelMedium,
                    )
                  ],
                )
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
