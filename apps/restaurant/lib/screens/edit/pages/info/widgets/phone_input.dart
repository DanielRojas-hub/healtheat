import 'package:common/services/restaurant/restaurant_bloc.dart';
import 'package:common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/register/cubit/register_cubit.dart';
import 'package:easy_mask/easy_mask.dart';

class PhoneInput extends StatelessWidget {
  const PhoneInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoaded) {
          final restaurant = state.restaurant;
          // String phone = restaurant.phoneNumber!.replaceAll(' ', '');
          return BlocBuilder<RegisterCubit, RegisterState>(
            buildWhen: (previous, current) => previous.phone != current.phone,
            builder: (context, state) {
              return CustomTextField(
                textInputType: TextInputType.number,
                inputFormatters: [
                  TextInputMask(
                      mask: '(999)-999-9999',
                      placeholder: '',
                      maxPlaceHolders: 11,
                      reverse: false),
                ],
                onChanged: (phone) =>
                    context.read<RegisterCubit>().phoneChanged(phone),
                errorText: state.phone.displayError != null
                    ? 'Invalid phone number'
                    : null,
                initialValue: restaurant.phoneNumber,
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
