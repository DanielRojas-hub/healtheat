import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/button_stars.dart';
import 'package:healtheat/common/widgets/image_container.dart';

import '../base_card.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard(
      {super.key,
      required this.displayName,
      required this.date,
      required this.review,
      this.imageUrl});

  final String displayName;
  final String date;
  final String review;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      elevation: 0,
      borderRadius: BorderRadius.zero,
      child: Row(children: [
        ImageContainer(
            imageUrl: imageUrl, height: 45, width: 45, isCircle: true),
        const SizedBox(width: 10),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(displayName, style: Theme.of(context).textTheme.titleMedium),
              Text(date, style: Theme.of(context).textTheme.labelSmall)
            ]),
            const ButtonStars(rating: 3),
            const SizedBox(height: 5),
            Text(review, style: Theme.of(context).textTheme.bodySmall)
          ]),
        )
      ]),
    );
  }
}
