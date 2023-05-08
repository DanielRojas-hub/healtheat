import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/custom_divider.dart';
import 'package:healtheat/common/widgets/dotted_divider.dart';
import 'package:healtheat/common/widgets/total_card.dart';

import '../cart.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CartFloatingActionButton(),
      appBar: AppBar(title: const Text('Cart'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
        child: Material(
          color: Colors.grey[50],
          child: ListView(
            children: [
              const CartList(),
              CustomDivider(backgroundColor: Theme.of(context).cardColor),
              const DeliveryCard(),
              CustomDivider(backgroundColor: Theme.of(context).cardColor),
              const TotalCard(label: Text('\$36.24')),
              const DottedDivider(padding: EdgeInsets.only(top: 15)),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
