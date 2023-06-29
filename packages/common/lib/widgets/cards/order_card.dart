import 'package:flutter/material.dart';
import 'package:common/extension/custom_theme_extension.dart';
import 'package:common/utils/constants.dart';

import '../base_card.dart';
import '../custom_icon_button.dart';
import '../custom_label_button.dart';
import '../image_container.dart';
import '../skelton.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.restaurantName,
    required this.orderId,
    required this.status,
    //required this.foods,
    this.onTap,
    this.onTapFavorite,
  });

  final String restaurantName;
  final String orderId;
  final int status;
  //final List<String> foods;
  final VoidCallback? onTap;
  final VoidCallback? onTapFavorite;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Constants.radiusLarge),
      child: Stack(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 5, bottom: 17.5, left: 10, right: 10),
            child: Column(children: [
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Text(restaurantName,
                                style: Theme.of(context).textTheme.titleLarge)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text("#$orderId",
                                style:
                                    Theme.of(context).textTheme.labelMedium)),
                      ],
                    ),
                  ],
                ),
              ),
              /*Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                            children: List.generate(
                                foods.length > 3 ? 4 : foods.length,
                                (index) => Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: index >= 3
                                          ? CustomLabelButton(
                                              label: const Text('+'),
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .tertiaryContainer,
                                              color: context.theme.blackColor)
                                          : CustomLabelButton(
                                              label: Text(foods[index]),
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .tertiaryContainer,
                                              color: context.theme.blackColor),
                                    ))),
                      ),
                    ]),
              ),*/
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomLabelButton(
                        label: Text(
                          status == 0
                              ? 'Processing'
                              : status == 1
                                  ? 'Cooking'
                                  : status == 2
                                      ? 'On its way'
                                      : 'Delivered',
                        ),
                        icon: status == 0
                            ? Icons.schedule
                            : status == 1
                                ? Icons.soup_kitchen
                                : status == 2
                                    ? Icons.delivery_dining
                                    : Icons.check,
                      ),
                    ]),
              ),
            ]),
          ),
        ]),
      ]),
    );
  }
}

class SkeletonOrderCard extends StatelessWidget {
  const SkeletonOrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      borderRadius: BorderRadius.circular(Constants.radiusLarge),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const ImageContainer(
            height: 150,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(Constants.radiusLarge))),
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 17.5, left: 10, right: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Skelton(
                width: 125,
                borderRadius: BorderRadius.circular(Constants.radiusInfinite)),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Skelton(
                  width: 125,
                  borderRadius:
                      BorderRadius.circular(Constants.radiusInfinite)),
            ),
          ]),
        ),
      ]),
    );
  }
}
