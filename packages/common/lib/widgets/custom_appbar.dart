import 'package:flutter/material.dart';
import 'package:common/utils/constants.dart';
import 'package:common/widgets/custom_icon_button.dart';
import 'package:common/widgets/image_container.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.onTapFavorite,
    this.isFavorite = false,
    this.imageUrl,
    required this.height,
  });

  final VoidCallback? onTapFavorite;
  final bool isFavorite;
  final String? imageUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: height,
      flexibleSpace: FlexibleSpaceBar(
          background: imageUrl != null
              ? Image.network(imageUrl!, fit: BoxFit.cover)
              : const ImageContainer()),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: CustomIconButton(
              onTap: () => Navigator.of(context).pop(),
              elevation: 0,
              borderRadius: BorderRadius.circular(Constants.radiusInfinite),
              padding: const EdgeInsets.all(10.0),
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              iconData: Icons.arrow_back,
              color: Theme.of(context).colorScheme.onSecondaryContainer),
        ),
      ),
      // actions: [
      //   Padding(
      //     padding: const EdgeInsets.only(right: 16),
      //     child: FittedBox(
      //       fit: BoxFit.scaleDown,
      //       child: CustomIconButton(
      //           onTap: onTapFavorite,
      //           elevation: 0,
      //           borderRadius: BorderRadius.circular(Constants.radiusInfinite),
      //           padding: const EdgeInsets.all(10.0),
      //           backgroundColor:
      //               Theme.of(context).colorScheme.secondaryContainer,
      //           iconData: isFavorite
      //               ? Icons.favorite
      //               : Icons.favorite_outline_outlined,
      //           color: isFavorite
      //               ? context.theme.redColor
      //               : Theme.of(context).disabledColor),
      //     ),
      //   ),
      // ],
    );
  }
}
