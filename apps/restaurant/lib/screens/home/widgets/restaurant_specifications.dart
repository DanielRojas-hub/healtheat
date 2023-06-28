import 'package:common/services/services.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:restaurant/router/route_name.dart';

class RestaurantSpecifications extends StatelessWidget {
  const RestaurantSpecifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoaded) {
          final restaurant = state.restaurant;
          DateTime openTime = DateTime.parse(restaurant.openTime!);
          DateTime closeTime = DateTime.parse(restaurant.closeTime!);
          // DateFormat('HH:mm:ss').parse(restaurant.openTime!);
          // DateTime closeTime =
          //     DateFormat('HH:mm:ss').parse(restaurant.closeTime!);
          return Wrap(
              alignment: WrapAlignment.center,
              spacing: 10.0,
              runAlignment: WrapAlignment.center,
              runSpacing: 10.0,
              children: [
                // CustomLabelButton(
                //     label: Text(restaurant.rating.toString()),
                //     icon: Icons.star_rate_rounded,
                //     color: Theme.of(context).colorScheme.onTertiaryContainer,
                //     backgroundColor:
                //         Theme.of(context).colorScheme.tertiaryContainer,
                //     iconColor: context.theme.rateColor),
                CustomLabelButton(
                    icon: Icons.schedule,
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                    backgroundColor:
                        Theme.of(context).colorScheme.tertiaryContainer,
                    label: Text(DateFormat('HH:mm').format(openTime),
                        style: Theme.of(context).textTheme.labelMedium)),
                CustomLabelButton(
                  label: Text(DateFormat('HH:mm').format(closeTime)),
                  icon: Icons.schedule,
                ),
                CustomLabelButton(
                  label: const Text("Add a new food to the menu"),
                  icon: Icons.add,
                  onTap: () {
                    context.goNamed(RouteName.addFood,
                        pathParameters: {'restaurantId': restaurant.id});
                  },
                )
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
