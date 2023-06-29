import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../register.dart';

class ConfirmPasswordInput extends StatelessWidget {
  const ConfirmPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.confirmedPassword != current.confirmedPassword ||
          previous.isVisible != current.isVisible,
      builder: (context, state) {
        return TextField(
          onChanged: (confirmPassword) => context
              .read<RegisterCubit>()
              .confirmedPasswordChanged(confirmPassword),
          obscureText: !state.isVisible,
          decoration: InputDecoration(
            labelText: "Confirm password",
            errorText: state.password.displayError != null
                ? 'invalid confirm password'
                : null,
            suffixIcon: IconButton(
              onPressed: () =>
                  context.read<RegisterCubit>().visibilityChanged(),
              icon: Icon(
                state.isVisible ? Icons.visibility : Icons.visibility_off,
                color: state.isVisible
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).disabledColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
