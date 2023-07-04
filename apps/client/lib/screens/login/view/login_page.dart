import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage(
      {super.key, required this.loginName, required this.registerName});

  final String loginName;
  final String registerName;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) =>
            LoginCubit(context.read<AuthenticationRepository>()),
      )
    ], child: LoginView(loginName: loginName, registerName: registerName));
  }
}
