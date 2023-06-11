import 'package:common/extension/custom_theme_extension.dart';
import 'package:flutter/material.dart';

class PaymentMethodFloatingActionButton extends StatelessWidget {
  const PaymentMethodFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.5,
      child: FloatingActionButton.extended(
        backgroundColor: context.theme.blackColor,
        onPressed: () {},
        label: SizedBox(
          width: 4 * MediaQuery.of(context).size.width / 5,
          child: const Center(child: Text('Pay Now')),
        ),
      ),
    );
  }
}
