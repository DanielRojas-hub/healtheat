import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';

import 'package:healtheat/common/widgets/custom_background_widget.dart';
import 'package:healtheat/common/widgets/custom_divider.dart';
import 'package:healtheat/common/widgets/dotted_divider.dart';
import 'package:healtheat/common/widgets/total_card.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Details'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
          child: Material(
            color: Colors.grey[50],
            child: ListView(
              children: [
                const CustomBackgroundWidget(child: SizedBox(height: 15)),
                CustomBackgroundWidget(
                  child: Text('Ordering From',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                const CustomBackgroundWidget(child: CustomDivider()),
                CustomBackgroundWidget(
                  child: Text('Delivery To:',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                CustomBackgroundWidget(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Address',
                            style: Theme.of(context).textTheme.labelSmall),
                        Text(
                          'New address',
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  decoration: TextDecoration.underline),
                        ),
                      ]),
                ),
                const CustomBackgroundWidget(child: CustomDivider()),
                CustomBackgroundWidget(
                  child: Text('Items in Cart',
                      style: Theme.of(context).textTheme.titleMedium),
                ),
                const CustomBackgroundWidget(
                    child:
                        CustomDivider(margin: EdgeInsets.only(bottom: 15.0))),
                const CustomBackgroundWidget(child: DottedDivider()),
                const TotalCard(label: Text('\$28.48')),
                const CustomBackgroundWidget(
                    child: DottedDivider(padding: EdgeInsets.only(top: 15))),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
