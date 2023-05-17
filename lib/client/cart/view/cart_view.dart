import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/custom_background_widget.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
        child: Material(
          color: Colors.grey[50],
          child: ListView(
            children: const [
              CartList(),
              CustomBackgroundWidget(
                  child: CustomDivider(margin: EdgeInsets.only(bottom: 15.0))),
              DeliveryCard(),
              CustomBackgroundWidget(child: CustomDivider()),
              TotalCard(label: Text('\$36.24')),
              CustomBackgroundWidget(
                  child: DottedDivider(padding: EdgeInsets.only(top: 15))),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
