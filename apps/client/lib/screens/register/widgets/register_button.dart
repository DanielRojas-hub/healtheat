import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import '../register.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const Center(child: CircularProgressIndicator())
            : ElevatedButton(
                onPressed: state.isValid
                    ? () async {
                        final isSuccess = await context
                            .read<RegisterCubit>()
                            .registerFormSubmitted();
                        if (isSuccess) context.pop();
                      }
                    : null,
                child: const Text('REGISTER'),
              );
      },
    );
  }
}
