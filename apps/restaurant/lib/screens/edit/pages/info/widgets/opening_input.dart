import 'package:common/services/restaurant/restaurant_bloc.dart';
import 'package:common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/router/route_name.dart';
import 'package:restaurant/screens/register/cubit/register_cubit.dart';

class OpeningTimeInput extends StatelessWidget {
  const OpeningTimeInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoaded) {
          final restaurant = state.restaurant;
          return BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (previous, current) =>
                previous.openingTime != current.openingTime,
            builder: (context, state) {
              return CustomTextField(
                controller: context.read<RegisterCubit>().openingTimeController,
                readOnly: true,
                prefixText: 'Opening time',
                icon: const Icon(Icons.schedule, size: 20),
                onTap: () async {
                  final Map<String, String> queryParameters = {
                    'type': 'open',
                  };
                  if (restaurant.openTime != "") {
                    queryParameters['initTime'] =
                        DateTime.parse(restaurant.openTime!).toString();
                  }
                  final time = await context.pushNamed(RouteName.timeEditPicker,
                      queryParameters: queryParameters) as DateTime?;
                  context.read<RegisterCubit>().openingTimeChanged(time);
                },
                errorText: state.openingTime.displayError != null
                    ? 'Invalid schedule'
                    : null,
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
