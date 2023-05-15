import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/bottom_sheet.dart';

import '../payment_method.dart';

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            BottomSheetWidget(),
          ]),
        ),
      ),
    );
  }
}
