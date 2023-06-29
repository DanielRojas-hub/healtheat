import 'package:common/services/services.dart';
import 'package:common/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(Constants.margin),
      children: const [
        PhoneNumber(),
      ],
    );
  }
}

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoaded) {
          final restaurant = state.restaurant;
          return InfoAbout(
              label: Text(restaurant.phoneNumber ?? ''), iconData: Icons.phone);
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
