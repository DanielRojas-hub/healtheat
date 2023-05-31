import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/button_stars.dart';
import 'package:healtheat/common/widgets/image_container.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard(
      {super.key,
      required this.name,
      required this.date,
      required this.review});

  final String name;
  final String date;
  final String review;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const ImageContainer(
          imageUrl:
              "https://i.pinimg.com/736x/5c/84/3b/5c843bd1b68bbf8935e6239c301dc342.jpg",
          height: 45,
          width: 45,
          isCircle: true),
      const SizedBox(width: 10),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              name,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(date, style: Theme.of(context).textTheme.bodySmall)
          ]),
          const ButtonStars(rating: 3),
          Text(
            review,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ))
    ]);
  }
}
