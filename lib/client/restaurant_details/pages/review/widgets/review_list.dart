import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/cards/review_card.dart';
import 'package:healtheat/common/widgets/custom_divider.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(Constants.margin),
      itemBuilder: (BuildContext context, int index) {
        return const ReviewCard(
          displayName: 'Esther Howard',
          date: 'Dec 03, 2023',
          review: 'La comida me parecio rica',
          imageUrl:
              'https://i.pinimg.com/736x/5c/84/3b/5c843bd1b68bbf8935e6239c301dc342.jpg',
        );
      },
      itemCount: 4,
      separatorBuilder: (BuildContext context, int index) =>
          const CustomDivider(margin: EdgeInsets.symmetric(vertical: 10)),
    );
  }
}
