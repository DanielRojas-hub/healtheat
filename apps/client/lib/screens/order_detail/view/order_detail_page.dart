// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return MultiBlocProvider(providers: [
      BlocProvider<OrderBloc>(
          create: (context) => OrderBloc()..add(StreamOrder(orderId))),
    ], child: const OrderDetailView());
    //return const OrderDetailView();
  }
}
