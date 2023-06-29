import 'package:common/services/restaurant/restaurant_bloc.dart';
import 'package:common/utils/utils.dart';
import 'package:common/widgets/skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key, required this.restaurantId});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoaded) {
          final restaurant = state.restaurant;
          return ListView(
            padding: const EdgeInsets.all(Constants.margin),
            children: [
              InfoAbout(
                  label: Text(restaurant.phoneNumber!), iconData: Icons.phone),
              const SizedBox(height: 20),
              InfoAbout(
                  label: Text(restaurant.address!),
                  iconData: Icons.location_on),
            ],
          );
        }
        if (state is RestaurantLoading) {
          return const Skelton(width: 150);
        }
        return const SizedBox();
      },
    );
  }
}

class InfoAbout extends StatelessWidget {
  const InfoAbout({
    super.key,
    required this.iconData,
    required this.label,
  });
  final IconData iconData;
  final Widget label;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(iconData),
      const SizedBox(width: 10),
      DefaultTextStyle.merge(child: label)
    ]);
  }
}
