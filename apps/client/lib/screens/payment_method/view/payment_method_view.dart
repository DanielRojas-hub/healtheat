import 'package:client/router/route_name.dart';
import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:common/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:order_repository/order_repository.dart';

import '../payment_method.dart';

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentMethodCubit, PaymentMethodState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          print('SE VIENEEEEEEEEEEE');
          final order = Order(
              restaurantId: context.read<CartBloc>().state.cart.restaurantId,
              status: 0,
              userId: context.read<UserBloc>().state.user.id);
          context.read<OrderBloc>().add(AddOrder(order));
          context.read<CartBloc>().add(ClearCart());
          context.goNamed(RouteName.orders);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Payment Method'), centerTitle: true),
        floatingActionButton: const PaymentMethodFloatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
          child: Material(
            color: Colors.grey[50],
            child: ListView(children: const [
              SizedBox(height: 20),
              PaymentList(),
              SizedBox(height: 20),
            ]),
          ),
        ),
      ),
    );
  }
}
