import 'package:flutter/material.dart';

import '../past_orders.dart';

class PastOrdersView extends StatelessWidget {
  const PastOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const PastOrdersList(),
    );
  }
}
