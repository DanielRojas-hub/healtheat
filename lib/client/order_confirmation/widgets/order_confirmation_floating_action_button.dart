import 'package:flutter/material.dart';

class OrderConfirmationFloatingActionButton extends StatelessWidget {
  const OrderConfirmationFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.5,
      child: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
        label: SizedBox(
          width: 4 * MediaQuery.of(context).size.width / 5,
          child: const Center(child: Text('Place Order')),
        ),
      ),
    );
  }
}
