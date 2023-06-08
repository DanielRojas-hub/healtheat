// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../order_detail.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({
    Key? key,
    required this.restaurantId,
    required this.orderId,
  }) : super(key: key);

  final String restaurantId;
  final String orderId;

  @override
  Widget build(BuildContext context) {
    return const OrderDetailView();
  }
}
