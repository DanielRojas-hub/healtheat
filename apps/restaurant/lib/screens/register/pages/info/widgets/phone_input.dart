import 'package:common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/register/cubit/register_cubit.dart';

class PhoneInput extends StatelessWidget {
  const PhoneInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) => previous.phone != current.phone,
      builder: (context, state) {
        return CustomTextField(
          textInputType: TextInputType.number,
          onChanged: (phone) =>
              context.read<RegisterCubit>().phoneChanged(phone),
          errorText:
              state.phone.displayError != null ? 'Invalid phone number' : null,
        );
      },
    );
  }
}
