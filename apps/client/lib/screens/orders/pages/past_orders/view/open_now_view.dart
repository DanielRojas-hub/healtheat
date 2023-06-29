import 'package:flutter/material.dart';

import '../past_orders.dart';

class OpenNowView extends StatelessWidget {
  const OpenNowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: const OpenNowList(),
    );
  }
}
