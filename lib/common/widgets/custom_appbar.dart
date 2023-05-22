import 'package:flutter/material.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/custom_icon_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.onTapFavorite,
    required this.isFavorite,
    required this.imageUrl,
    required this.height,
  });

  final VoidCallback? onTapFavorite;
  final bool isFavorite;
  final String imageUrl;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: height,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(imageUrl, fit: BoxFit.cover),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: CustomIconButton(
            borderRadius: BorderRadius.circular(Constants.radiusInfinite),
            iconSize: 20.0,
            padding: const EdgeInsets.all(10.0),
            elevation: 0,
            backgroundColor: Theme.of(context).cardColor,
            iconData: Icons.arrow_back,
            color: Theme.of(context).disabledColor,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: CustomIconButton(
              onTap: onTapFavorite,
              borderRadius: BorderRadius.circular(Constants.radiusInfinite),
              iconSize: 20.0,
              elevation: 0,
              padding: const EdgeInsets.all(10.0),
              backgroundColor: Theme.of(context).cardColor,
              iconData:
                  isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
              color: isFavorite
                  ? context.theme.redColor
                  : Theme.of(context).disabledColor,
            ),
          ),
        ),
      ],
    );
  }
}
