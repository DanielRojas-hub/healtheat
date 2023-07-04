// ignore_for_file: must_be_immutable

import 'package:cart_repository/cart_repository.dart';
import 'package:client/screens/payment_method/cubit/payment_method_cubit.dart';
import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:common/extension/custom_theme_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:order_repository/order_repository.dart';

import '../../../router/route_name.dart';

class PaymentMethodFloatingActionButton extends StatelessWidget {
  PaymentMethodFloatingActionButton({super.key});
  //bool paymentSuccess = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.5,
      child: FloatingActionButton.extended(
        backgroundColor: context.theme.blackColor,
        onPressed: () {
          context.read<PaymentMethodCubit>().submit(
                context,
                context.read<CartBloc>().state.cart,
              );
          //if (paymentSuccess) {
          final order = Order(
              restaurantId: context.read<CartBloc>().state.cart.restaurantId,
              status: 0,
              userId: context.read<UserBloc>().state.user.id);
          context.read<OrderBloc>().add(AddOrder(order));
          // context.read<PetitionBloc>().add(AddPetitions(order.id, cart.petitions));
          Navigator.of(context).pop();
          context.read<CartBloc>().add(ClearCart());
          context.goNamed(RouteName.orders);
          //}
        },
        label: SizedBox(
          width: 4 * MediaQuery.of(context).size.width / 5,
          child: const Center(child: Text('Pay Now')),
        ),
      ),
    );
  }
}
