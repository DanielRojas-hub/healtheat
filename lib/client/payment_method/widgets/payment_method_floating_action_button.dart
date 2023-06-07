import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/client/payment_method/payment_method.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';

class PaymentMethodFloatingActionButton extends StatelessWidget {
  const PaymentMethodFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.5,
      child: FloatingActionButton.extended(
        backgroundColor: context.theme.blackColor,
        onPressed: () => context.read<PaymentMethodCubit>().submit(context),
        label: SizedBox(
          width: 4 * MediaQuery.of(context).size.width / 5,
          child: const Center(child: Text('Pay Now')),
        ),
      ),
    );
  }
}
