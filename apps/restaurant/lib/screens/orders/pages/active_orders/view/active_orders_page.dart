import 'package:common/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../active_orders.dart';

class ActiveOrdersPage extends StatelessWidget {
  const ActiveOrdersPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const ActiveOrdersView();
  }
}
