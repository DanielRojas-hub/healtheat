// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../register.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({
    Key? key,
    required this.loginName,
    required this.registerName,
  }) : super(key: key);

  final String loginName;
  final String registerName;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<RegisterCubit>(
          create: (context) =>
              RegisterCubit(context.read<AuthenticationRepository>()))
    ], child: RegisterView(loginName: loginName, registerName: registerName));
  }
}
