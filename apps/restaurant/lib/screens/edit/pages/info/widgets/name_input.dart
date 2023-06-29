import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/register/cubit/register_cubit.dart';

class NameInput extends StatelessWidget {
  const NameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoaded) {
          final restaurant = state.restaurant;
          print(restaurant.displayName);
          return BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (previous, current) => previous.name != current.name,
            builder: (context, state) {
              return CustomTextField(
                icon: const Icon(Icons.storefront, size: 20),
                onChanged: (name) =>
                    context.read<RegisterCubit>().nameChanged(name),
                errorText:
                    state.name.displayError != null ? 'invalid name' : null,
                initialValue: restaurant.displayName ?? '',
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
