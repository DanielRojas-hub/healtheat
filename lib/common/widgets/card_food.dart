import 'package:flutter/material.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';
import 'package:healtheat/common/widgets/custom_label_buttom.dart';

import 'base_card.dart';
import 'custom_circular_button.dart';
import 'image_container.dart';

class CardFood extends StatelessWidget {
  const CardFood(
      {super.key,
      required this.url,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.isFavorite,
      this.onTap,
      this.onTapFavorite,
      this.onTapPrice});

  final String url;
  final String title;
  final String subtitle;
  final String price;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onTapFavorite;
  final VoidCallback? onTapPrice;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: onTap,
      child: Stack(children: [
        Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: ImageContainer(url: url)),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.titleLarge),
                    Text(subtitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(height: 10),
                    CustomLabelButton(
                      onTap: onTapPrice,
                      title: price,
                      width: MediaQuery.of(context).size.width,
                    )
                  ],
                ),
              ),
            ]),
        Positioned(
          top: 5,
          right: 5,
          child: CustomCircularButton(
              onTap: onTapFavorite,
              iconData: isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite
                  ? context.theme.redColor
                  : Theme.of(context).disabledColor),
        ),
      ]),
    );
  }
}
