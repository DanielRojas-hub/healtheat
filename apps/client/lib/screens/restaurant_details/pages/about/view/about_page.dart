import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../about.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    Key? key,
    required this.restaurantId,
  }) : super(key: key);

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RestaurantBloc>(
      create: (context) =>
          RestaurantBloc()..add(StreamRestaurant(restaurantId)),
      child: const AboutView(),
    );
  }
}
