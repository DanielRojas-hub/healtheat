import 'package:flutter/material.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/custom_label_buttom.dart';

class CustomCardRestaurant extends StatelessWidget {
  const CustomCardRestaurant({
    super.key,
    required this.name,
    required this.url,
    required this.price,
    required this.rate,
    required this.time,
    required this.typeFood,
    required this.onTap,
    required this.isFavorite,
  });

  final String name;
  final String url;
  final String price;
  final String rate;
  final String time;
  final List<String> typeFood;
  final VoidCallback onTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.radiusMedium)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Constants.radiusMedium),
        child: Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Constants.radiusMedium),
              color: Theme.of(context).cardColor),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(Constants.radiusMedium)),
                          image: DecorationImage(
                              image: NetworkImage(url), fit: BoxFit.cover))),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  Constants.radiusInfinite),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Icon(
                                        isFavorite
                                            ? Icons.favorite
                                            : Icons.favorite_outline_outlined,
                                        color: isFavorite
                                            ? context.theme.redColor
                                            : Theme.of(context).disabledColor),
                                  ),
                                ),
                              ),
                            )
                          ]),
                      const SizedBox(height: 7),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomLabelButtom(
                              title: price,
                              icon: Icons.electric_scooter,
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                            CustomLabelButtom(title: time, icon: Icons.schedule)
                          ]),
                    ]),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                          typeFood.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: CustomLabelButtom(
                                    title: typeFood[index],
                                    backgroundColor: context.theme.whiteColor,
                                    color: context.theme.blackColor),
                              )),
                    ),
                    CustomLabelButtom(
                      title: rate,
                      icon: Icons.star_rate_rounded,
                      backgroundColor: Colors.white,
                      color: Colors.black,
                      iconColor: Colors.amber,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
