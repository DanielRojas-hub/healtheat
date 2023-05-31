import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/cards/review_card.dart';
import 'package:healtheat/common/widgets/custom_divider.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(Constants.margin),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return const ReviewCard(
            name: 'Esther Howard',
            date: '3/02/2022',
            review: 'La comida me parecio rica');
      },
      itemCount: 4,
      separatorBuilder: (BuildContext context, int index) =>
          const CustomDivider(margin: EdgeInsets.symmetric(vertical: 10)),
    );
  }
}
