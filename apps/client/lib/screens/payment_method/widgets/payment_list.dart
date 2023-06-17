import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../payment_method.dart';
import 'payment_card.dart';

class PaymentList extends StatelessWidget {
  const PaymentList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return /* ListView.separated(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (context, index) {
        return const PaymentCard();
      },
      itemCount: 3,
      separatorBuilder: (BuildContext context, int index) => CustomDivider(
        margin: EdgeInsets.zero,
        color: Colors.grey[100],
      ),
    ); */
        BlocBuilder<PaymentMethodCubit, PaymentMethod>(
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          children: [
            PaymentCard(
              label: 'Apple Pay',
              paymentMethod: PaymentMethod.applePay,
              selected: state,
              onTap: (value) =>
                  context.read<PaymentMethodCubit>().select(value),
            ),
            PaymentCard(
              label: 'Paypal',
              paymentMethod: PaymentMethod.paypal,
              selected: state,
              onTap: (value) =>
                  context.read<PaymentMethodCubit>().select(value),
            ),
            PaymentCard(
              label: 'Credit Card',
              paymentMethod: PaymentMethod.creditCard,
              selected: state,
              onTap: (value) =>
                  context.read<PaymentMethodCubit>().select(value),
            ),
          ],
        );
      },
    );
  }
}
