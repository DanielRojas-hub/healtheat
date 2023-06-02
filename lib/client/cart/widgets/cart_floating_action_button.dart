import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/services/cart/cart_bloc.dart';
import 'package:healtheat/common/services/restaurant/restaurant_bloc.dart';

class CartFloatingActionButton extends StatelessWidget {
  const CartFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.5,
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          final status = state.status;
          if (status == CartStatus.notEmpty) {
            return FloatingActionButton.extended(
              heroTag: 'cart',
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () => context.goNamed(RouteName.orderConfirmation),
              label: SizedBox(
                width: 4 * MediaQuery.of(context).size.width / 5,
                child: Row(children: [
                  Icon(Icons.schedule,
                      size: 20, color: Theme.of(context).colorScheme.onPrimary),
                  const SizedBox(width: 10),
                  const Expanded(child: RestaurantDeliveryTime()),
                  Text(
                    'Checkout',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  )
                ]),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class RestaurantDeliveryTime extends StatelessWidget {
  const RestaurantDeliveryTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoaded) {
          final restaurant = state.restaurant;
          return Text(
            '20-25 min',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          );
        }
        return Text(
          '-',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        );
      },
    );
  }
}
