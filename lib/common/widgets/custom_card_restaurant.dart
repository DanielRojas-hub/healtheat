import 'package:flutter/material.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';
import 'package:healtheat/common/utils/constants.dart';

import 'base_card.dart';
import 'custom_icon_button.dart';
import 'custom_label_buttom.dart';
import 'image_container.dart';

class CustomCardRestaurant extends StatelessWidget {
  const CustomCardRestaurant({
    super.key,
    required this.name,
    required this.url,
    required this.price,
    required this.rate,
    required this.time,
    required this.typeFood,
    this.onTap,
    required this.isFavorite,
    this.onTapFavorite,
  });

  final String name;
  final String url;
  final String price;
  final String rate;
  final String time;
  final List<String> typeFood;
  final VoidCallback? onTap;
  final VoidCallback? onTapFavorite;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Constants.radiusLarge),
      child: Stack(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ImageContainer(
              url: url,
              height: 150,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(Constants.radiusLarge))),
          Padding(
            padding: const EdgeInsets.only(
                top: 5, bottom: 17.5, left: 10, right: 10),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                CustomIconButton(
                  onTap: onTapFavorite,
                  borderRadius: BorderRadius.circular(Constants.radiusInfinite),
                  iconSize: 22.0,
                  elevation: 0,
                  backgroundColor: Theme.of(context).cardColor,
                  iconData: isFavorite
                      ? Icons.favorite
                      : Icons.favorite_outline_outlined,
                  color: isFavorite
                      ? context.theme.redColor
                      : Theme.of(context).disabledColor,
                )
              ]),
              const SizedBox(height: 5),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                CustomLabelButton(
                  label: price,
                  icon: Icons.electric_scooter,
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                CustomLabelButton(label: time, icon: Icons.schedule)
              ]),
            ]),
          )
        ]),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: List.generate(
                    typeFood.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: CustomLabelButton(
                              label: typeFood[index],
                              backgroundColor: context.theme.whiteColor,
                              color: context.theme.blackColor),
                        )),
              ),
              CustomLabelButton(
                label: rate,
                icon: Icons.star_rate_rounded,
                backgroundColor: context.theme.whiteColor,
                color: context.theme.blackColor,
                iconColor: Colors.amber,
              )
            ],
          ),
        )
      ]),
    );
  }
}
