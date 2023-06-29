import 'package:common/services/petition/petition_bloc.dart';
import 'package:common/services/services.dart';
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
        BlocProvider<OrderBloc>(
          create: (context) => OrderBloc(),
        ),
        BlocProvider<PetitionBloc>(
          create: (context) => PetitionBloc(),
        )
      ],
      child: const PaymentMethodView(),
    );
  }
}
