import 'package:flutter/material.dart';
import 'package:common/extension/custom_theme_extension.dart';
import 'package:common/utils/constants.dart';

import '../base_card.dart';
import '../custom_label_button.dart';
import '../image_container.dart';
import '../skelton.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.name,
    required this.rating,
    required this.deliveryPriceRange,
    required this.deliveryTimeRange,
    required this.isFavorite,
    required this.typeFood,
    this.onTap,
    this.onTapFavorite,
    this.imageUrl,
  });

  final String name;
  final num rating;
  final String deliveryPriceRange;
  final String deliveryTimeRange;
  final bool isFavorite;
  final List<String> typeFood;
  final VoidCallback? onTap;
  final VoidCallback? onTapFavorite;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: onTap,
      borderRadius: BorderRadius.circular(Constants.radiusLarge),
      child: Stack(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ImageContainer(
              imageUrl: imageUrl,
              height: 150,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(Constants.radiusLarge))),
          Padding(
            padding: const EdgeInsets.only(
                top: 5, bottom: 17.5, left: 10, right: 10),
            child: Column(children: [
              Row(children: [
                Expanded(
                    child: Text(name,
                        style: Theme.of(context).textTheme.titleLarge)),
                // CustomIconButton(
                //   onTap: onTapFavorite,
                //   borderRadius: BorderRadius.circular(Constants.radiusInfinite),
                //   iconSize: 22.0,
                //   elevation: 0,
                //   backgroundColor: Theme.of(context).cardColor,
                //   iconData: isFavorite
                //       ? Icons.favorite
                //       : Icons.favorite_outline_outlined,
                //   color: isFavorite
                //       ? context.theme.redColor
                //       : Theme.of(context).disabledColor,
                // )
              ]),
              const SizedBox(height: 5),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                CustomLabelButton(
                  icon: Icons.electric_scooter,
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                  backgroundColor:
                      Theme.of(context).colorScheme.tertiaryContainer,
                  label: Text(deliveryPriceRange,
                      style: Theme.of(context).textTheme.labelMedium),
                ),
                CustomLabelButton(
                    label: Text(deliveryTimeRange), icon: Icons.schedule)
              ]),
            ]),
          )
        ]),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Row(
                  children: List.generate(
                      typeFood.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CustomLabelButton(
                                label: Text(typeFood[index]),
                                backgroundColor: context.theme.whiteColor,
                                color: context.theme.blackColor),
                          ))),
            ),
            CustomLabelButton(
                label: Text(rating.toString()),
                icon: Icons.star_rate_rounded,
                backgroundColor: context.theme.whiteColor,
                color: context.theme.blackColor,
                iconColor: context.theme.rateColor)
          ]),
        )
      ]),
    );
  }
}

class SkeletonRestaurantCard extends StatelessWidget {
  const SkeletonRestaurantCard({Key? key}) : super(key: key);

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
