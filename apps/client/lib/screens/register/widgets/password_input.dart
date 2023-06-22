import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../register.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      buildWhen: (previous, current) =>
          previous.password != current.password ||
          previous.isVisible != current.isVisible,
      builder: (context, state) {
        return TextField(
          onChanged: (password) =>
              context.read<RegisterCubit>().passwordChanged(password),
          obscureText: !state.isVisible,
          decoration: InputDecoration(
            labelText: "Password",
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
            errorText:
                state.password.displayError != null ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}
