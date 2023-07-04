import 'package:client/screens/payment_method/cubit/payment_method_cubit.dart';
import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:common/extension/custom_theme_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodFloatingActionButton extends StatelessWidget {
  const PaymentMethodFloatingActionButton({super.key});
  //bool paymentSuccess = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentMethodCubit, PaymentMethodState>(
      builder: (context, state) {
        return SizedBox(
          height: 42.5,
          child: FloatingActionButton.extended(
            backgroundColor: context.theme.blackColor,
            onPressed: () => context.read<PaymentMethodCubit>().submit(
                  context,
                  context.read<CartBloc>().state.cart,
                ),
            label: SizedBox(
              width: 4 * MediaQuery.of(context).size.width / 5,
              child: const Center(child: Text('Pay Now')),
            ),
          ),
        );
      },
    );
  }
}
