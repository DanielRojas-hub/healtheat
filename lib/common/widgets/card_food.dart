import 'package:flutter/material.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';
import 'package:healtheat/common/widgets/custom_label_buttom.dart';

class CardFood extends StatelessWidget {
  const CardFood(
      {super.key,
      required this.url,
      required this.title,
      required this.subtitle,
      required this.price,
      required this.isFavorite,
      required this.onTap,
      required this.onTapFavorite,
      required this.onTapPrice});

  final String url;
  final String title;
  final String subtitle;
  final String price;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onTapFavorite;
  final VoidCallback onTapPrice;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Ink(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12)),
        child: Stack(
          children: [
            Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: DecorationImage(
                              image: NetworkImage(url), fit: BoxFit.cover),
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12))),
                    ),
                  ),
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
                        CustomLabelButtom(
                            onTap: onTapPrice,
                            title: price,
                            width: MediaQuery.of(context).size.width)
                      ],
                    ),
                  ),
                ]),
            Positioned(
              top: 5,
              right: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Material(
                  color: Theme.of(context).cardColor,
                  child: InkWell(
                    onTap: onTapFavorite,
                    child: Ink(
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).cardColor),
                      child: Icon(Icons.favorite,
                          size: 22.0,
                          color: isFavorite
                              ? context.theme.redColor
                              : Theme.of(context).disabledColor),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
