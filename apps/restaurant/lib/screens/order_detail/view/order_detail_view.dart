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
                      const CustomBackgroundWidget(child: CustomDivider()),
                      CustomBackgroundWidget(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children: [
                                  state.order.status >= 1
                                      ? CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                          child: Icon(
                                            Icons.schedule,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ))
                                      : CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .tertiaryContainer,
                                          child: Icon(
                                            Icons.schedule,
                                            color:
                                                Theme.of(context).disabledColor,
                                          )),
                                  const SizedBox(height: 30),
                                  state.order.status >= 2
                                      ? CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                          child: Icon(
                                            Icons.soup_kitchen,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ))
                                      : CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .tertiaryContainer,
                                          child: Icon(
                                            Icons.soup_kitchen,
                                            color:
                                                Theme.of(context).disabledColor,
                                          )),
                                  const SizedBox(height: 30),
                                  state.order.status >= 3
                                      ? CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                          child: Icon(
                                            Icons.delivery_dining,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ))
                                      : CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .tertiaryContainer,
                                          child: Icon(
                                            Icons.delivery_dining,
                                            color:
                                                Theme.of(context).disabledColor,
                                          )),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('In Process',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                    Text(
                                        state.order.status >= 1
                                            ? 'Order has been processed'
                                            : 'Order is being processed',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall),
                                  ],
                                ),
                                const SizedBox(height: 45),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Cooking',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                    Text(
                                        state.order.status >= 2
                                            ? 'Order is ready'
                                            : state.order.status >= 1
                                                ? 'Order is being prepared'
                                                : 'Not yet',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall),
                                  ],
                                ),
                                const SizedBox(height: 45),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Delivery',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                    Text(
                                        state.order.status >= 3
                                            ? 'Order has arrived'
                                            : state.order.status >= 2
                                                ? 'Order on its way'
                                                : 'Not yet',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall),
                                  ],
                                ),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomLabelButton(
                                    onTap: state.order.status == 1
                                        ? () => {
                                              context.read<OrderBloc>().add(
                                                  UpdateOrder(state.order.id,
                                                      const {'status': 0}))
                                            }
                                        : () => {
                                              context.read<OrderBloc>().add(
                                                  UpdateOrder(state.order.id,
                                                      const {'status': 1}))
                                            },
                                    icon: Icons.touch_app_sharp,
                                    label: Text(
                                        state.order.status == 1
                                            ? 'Done!'
                                            : 'Select',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                  ),
                                  const SizedBox(height: 60),
                                  CustomLabelButton(
                                    onTap: state.order.status == 2
                                        ? () => {
                                              context.read<OrderBloc>().add(
                                                  UpdateOrder(state.order.id,
                                                      const {'status': 0}))
                                            }
                                        : () => {
                                              context.read<OrderBloc>().add(
                                                  UpdateOrder(state.order.id,
                                                      const {'status': 2}))
                                            },
                                    icon: Icons.touch_app_sharp,
                                    label: Text(
                                        state.order.status == 2
                                            ? 'Done!'
                                            : 'Select',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                  ),
                                  const SizedBox(height: 60),
                                  CustomLabelButton(
                                    onTap: state.order.status == 3
                                        ? () => {
                                              context.read<OrderBloc>().add(
                                                  UpdateOrder(state.order.id,
                                                      const {'status': 0}))
                                            }
                                        : () => {
                                              context.read<OrderBloc>().add(
                                                  UpdateOrder(state.order.id,
                                                      const {'status': 3}))
                                            },
                                    icon: Icons.touch_app_sharp,
                                    label: Text(
                                        state.order.status == 3
                                            ? 'Done!'
                                            : 'Select',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const CustomBackgroundWidget(child: CustomDivider()),
                      /*CustomBackgroundWidget(
                        child: Row(
                          children: [
                            /*ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                  '../assets/images/pfp.jpg',
                                  height: 70),
                            ),*/
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Designated Driver',
                                    style: Theme.of(context).textTheme.titleMedium),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Theme.of(context).primaryColor,
                                        size: 15,
                                      ),
                                      Text('4.5',
                                          style:
                                              Theme.of(context).textTheme.labelSmall),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: IconButton(
                                    icon: Icon(
                                      Icons.phone_in_talk_rounded,
                                      color: Theme.of(context).colorScheme.onPrimary,
                                    ),
                                    onPressed: () {}),
                              ),
                            ),
                          ],
                        ),
                      )*/
                      state.order.status >= 3
                          ? Center(
                              child: Text('Order has arrived!',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            )
                          : const SizedBox(),
                      const CustomBackgroundWidget(child: CustomDivider()),
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
