import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';
import 'package:healtheat/common/services/restaurant/restaurant_bloc.dart';
import 'package:healtheat/common/widgets/custom_label_button.dart';
import 'package:healtheat/common/widgets/skelton.dart';

class RestaurantSpecifications extends StatelessWidget {
  const RestaurantSpecifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoaded) {
          final restaurant = state.restaurant;
          return Wrap(
              alignment: WrapAlignment.center,
              spacing: 10.0,
              runAlignment: WrapAlignment.center,
              runSpacing: 10.0,
              children: [
                CustomLabelButton(
                    label: Text(restaurant.rating.toString()),
                    icon: Icons.star_rate_rounded,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                    backgroundColor:
                        Theme.of(context).colorScheme.tertiaryContainer,
                    iconColor: context.theme.rateColor),
                CustomLabelButton(
                    icon: Icons.electric_scooter,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                    backgroundColor:
                        Theme.of(context).colorScheme.tertiaryContainer,
                    label: Text(restaurant.deliveryPriceRange.toString(),
                        style: Theme.of(context).textTheme.labelMedium)),
                CustomLabelButton(
                    label: Text(restaurant.deliveryTimeRange.toString()),
                    icon: Icons.schedule)
              ]);
        }
        if (state is RestaurantLoading) {
          return Row(
            children: List.generate(
              3,
              (index) => const Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.5),
                      child: Skelton())),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
