import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';

import '../login.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return state.status.isInProgress
            ? const Center(child: CircularProgressIndicator())
            : ElevatedButton(
                onPressed: state.isValid
                    ? () async {
                        final isSuccess = await context
                            .read<LoginCubit>()
                            .logInWithCredentials();
                        if (isSuccess) context.pop();
                      }
                    : null,
                child: const Text('LOGIN'),
              );
      },
    );
  }
}
