import 'package:flutter/material.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
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
                            top: Radius.circular(20)),
                        image: DecorationImage(
                            image: NetworkImage(url), fit: BoxFit.cover))),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    children: [
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
                            borderRadius: BorderRadius.circular(100),
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
                                            : Theme.of(context).disabledColor)),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomLabelButtom(
                              title: price,
                              icon: Icons.electric_scooter,
                              backgroundColor: Colors.grey[300],
                              color: Colors.black),
                          CustomLabelButtom(title: time, icon: Icons.schedule)
                        ],
                      ),
                    ],
                  ),
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
                                  backgroundColor: Colors.white,
                                  color: Colors.black),
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
    );
  }
}
