import 'package:flutter/material.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';
import 'package:healtheat/common/utils/constants.dart';

import 'base_card.dart';
import 'custom_icon_button.dart';
import 'custom_label_buttom.dart';
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
  final Widget title;
  final Widget subtitle;
  final Widget price;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onTapFavorite;
  final VoidCallback? onTapPrice;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      onTap: onTap,
      child: Stack(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: ImageContainer(url: url)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              DefaultTextStyle.merge(
                  style: Theme.of(context).textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  child: title),
              DefaultTextStyle.merge(
                  style: Theme.of(context).textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  child: subtitle),
              const SizedBox(height: 10),
              CustomLabelButton(label: price, onTap: onTapPrice, expanded: true)
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
