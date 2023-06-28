import 'package:common/services/services.dart';
import 'package:common/utils/utils.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order Details'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
          child: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              if (state is OrderLoaded) {
                return Material(
                  color: Colors.grey[50],
                  child: ListView(
                    children: [
                      const CustomBackgroundWidget(child: CustomDivider()),
                      CustomBackgroundWidget(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Order ID',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                Text(state.order.id,
                                    style:
                                        Theme.of(context).textTheme.labelSmall),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  Clipboard.setData(
                                      ClipboardData(text: state.order.id));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Copied to clipboard'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },
                                icon:
                                    const Icon(Icons.copy, color: Colors.grey)),
                          ]
                              .map((widget) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: widget,
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: Text('Loading...'));
              }
            },
          ),
        ),
      ),
    );
  }
}
