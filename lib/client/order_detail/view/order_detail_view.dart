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
                const CustomBackgroundWidget(child: CustomDivider()),
                CustomBackgroundWidget(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text('Order ID',
                              style: Theme.of(context).textTheme.titleMedium),
                          Text('#000000',
                              style: Theme.of(context).textTheme.labelSmall),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.copy, color: Colors.grey)),
                    ]
                        .map((widget) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
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
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .tertiaryContainer,
                              child: const Icon(Icons.access_time,
                                  color: Colors.grey),
                            ),
                            const SizedBox(height: 30),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .tertiaryContainer,
                              child: const Icon(Icons.soup_kitchen,
                                  color: Colors.grey),
                            ),
                            const SizedBox(height: 30),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .tertiaryContainer,
                              child: const Icon(Icons.delivery_dining,
                                  color: Colors.grey),
                            ),
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
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                              Text('Process of your order',
                                  style:
                                      Theme.of(context).textTheme.labelSmall),
                            ],
                          ),
                          const SizedBox(height: 45),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Cooking',
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                              Text('Your order is getting ready',
                                  style:
                                      Theme.of(context).textTheme.labelSmall),
                            ],
                          ),
                          const SizedBox(height: 45),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Delivery',
                                  style:
                                      Theme.of(context).textTheme.titleSmall),
                              Text('Your order is on its way',
                                  style:
                                      Theme.of(context).textTheme.labelSmall),
                            ],
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          children: [
                            Text('12:30',
                                style: Theme.of(context).textTheme.titleSmall),
                            const SizedBox(height: 60),
                            Text('1:30',
                                style: Theme.of(context).textTheme.titleSmall),
                            const SizedBox(height: 60),
                            Text('2:30',
                                style: Theme.of(context).textTheme.titleSmall),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const CustomBackgroundWidget(child: CustomDivider()),
                CustomBackgroundWidget(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/images/pfp.jpg', height: 70),
                      ),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
