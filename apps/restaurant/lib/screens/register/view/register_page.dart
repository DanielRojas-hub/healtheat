import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/register/cubit/cuisine/cuisine_controller_cubit.dart';
import 'package:restaurant/screens/register/cubit/register/register_cubit.dart';
import 'package:restaurant/screens/register/register.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<RegisterCubit>(
        create: (context) => RegisterCubit(),
      ),
      BlocProvider<CuisineControllerCubit>(
        create: (context) => CuisineControllerCubit(),
      ),
    ], child: const RegisterView());
  }
}
