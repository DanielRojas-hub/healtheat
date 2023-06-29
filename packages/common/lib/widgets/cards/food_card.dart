import 'package:flutter/material.dart';
import 'package:common/utils/constants.dart';
import 'package:common/utils/string_fix.dart';

import '../base_card.dart';
import '../custom_label_button.dart';
import '../image_container.dart';
import '../skelton.dart';

class FoodCard extends StatelessWidget {
  const FoodCard(
      {super.key,
      this.imageUrl,
      required this.title,
      required this.categories,
      required this.price,
      required this.isFavorite,
      this.onTap,
      this.onTapFavorite,
      this.onTapPrice});

  final String? imageUrl;
  final String title;
  final num price;
  final bool isFavorite;
  final List<String> categories;
  final VoidCallback? onTap;
  final VoidCallback? onTapFavorite;
  final VoidCallback? onTapPrice;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: onTap,
      child: Stack(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: ImageContainer(imageUrl: imageUrl)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title,
                  style: Theme.of(context).textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
              Column(
                children: List.generate(
                  categories.length,
                  (index) => Text('- ${categories[index]}',
                      style: Theme.of(context).textTheme.labelMedium,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1),
                ),
              ),
              const SizedBox(height: 10),
              CustomLabelButton(
                  label: Text(
                    '\$${stringFix(price)}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  onTap: onTapPrice,
                  expanded: true)
            ]),
          ),
        ]),
        Positioned(
          top: 5,
          right: 5,
          child: CustomIconButton(
            onTap: onTapFavorite,
            iconData: isFavorite ? Icons.favorite : Icons.favorite_border,
            backgroundColor: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(Constants.radiusInfinite),
            iconSize: 16.0,
            padding: const EdgeInsets.all(6.0),
            color: isFavorite
                ? context.theme.redColor
                : Theme.of(context).disabledColor,
          ),
        ),
      ]),
    );
  }
}

class SkeletonFoodCard extends StatelessWidget {
  const SkeletonFoodCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Expanded(child: ImageContainer()),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 30),
            Skelton(
                borderRadius: BorderRadius.circular(Constants.radiusInfinite))
          ]),
        ),
      ]),
    );
  }
}
