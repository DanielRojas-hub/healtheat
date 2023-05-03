import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Material(
          color: Colors.grey[300],
          child: ListView(
            children: const [
              CartList(),
              DeliveryCard(),
              CustomDivider(),
              TotalCard(label: Text('\$36.24')),
              DottedDivider(),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
