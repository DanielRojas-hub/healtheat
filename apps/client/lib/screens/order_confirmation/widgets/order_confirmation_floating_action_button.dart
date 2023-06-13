import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderConfirmationFloatingActionButton extends StatelessWidget {
  const OrderConfirmationFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.5,
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final status = state.status;
          if (status == CartStatus.notEmpty) {
            return FloatingActionButton.extended(
              heroTag: 'order_confirmation',
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pop();
                context.read<CartBloc>().add(ClearCart());
              },
              label: SizedBox(
                width: 4 * MediaQuery.of(context).size.width / 5,
                child: const Center(child: Text('Place Order')),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}