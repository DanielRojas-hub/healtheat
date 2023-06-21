import 'package:common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/register/cubit/register_cubit.dart';

class AddressInput extends StatelessWidget {
  const AddressInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.address != current.address,
      builder: (context, state) {
        return CustomTextField(
          icon: const Icon(Icons.location_on, size: 20),
          onChanged: (address) =>
              context.read<RegisterCubit>().addressChanged(address),
          errorText:
              state.address.displayError != null ? 'Invalid address' : null,
        );
      },
    );
  }
}
