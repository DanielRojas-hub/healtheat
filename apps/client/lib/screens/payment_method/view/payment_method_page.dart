import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../payment_method.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PaymentMethodCubit>(
          create: (context) => PaymentMethodCubit(),
        ),
      ],
      child: const PaymentMethodView(),
    );
  }
}
