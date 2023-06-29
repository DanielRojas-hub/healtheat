import 'package:flutter/material.dart';

import '../active_orders.dart';

class ActiveOrdersView extends StatelessWidget {
  const ActiveOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const ActiveOrdersList(),
    );
  }
}
