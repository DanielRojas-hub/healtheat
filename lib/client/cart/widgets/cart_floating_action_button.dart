import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/services/cart/cart_bloc.dart';

class CartFloatingActionButton extends StatelessWidget {
  const CartFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.5,
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return FloatingActionButton.extended(
            backgroundColor: state.cart.isNotEmpty
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.tertiaryContainer,
            onPressed: state.cart.isNotEmpty
                ? () => context.goNamed(RouteName.orderConfirmation)
                : null,
            label: SizedBox(
              width: 4 * MediaQuery.of(context).size.width / 5,
              child: Row(
                children: [
                  Icon(
                    Icons.schedule,
                    size: 20,
                    color: state.cart.isNotEmpty
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: Text(
                    state.cart.isNotEmpty ? '20-25 min' : '-',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: state.cart.isNotEmpty
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context)
                                .colorScheme
                                .onTertiaryContainer),
                  )),
                  Text(
                    'Checkout',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: state.cart.isNotEmpty
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context)
                                  .colorScheme
                                  .onTertiaryContainer,
                        ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
