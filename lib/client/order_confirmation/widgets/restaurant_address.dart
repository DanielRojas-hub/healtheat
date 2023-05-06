import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/base_card.dart';

class RestaurantAddress extends StatelessWidget {
  const RestaurantAddress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      elevation: 0,
      borderRadius: BorderRadius.zero,
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.lightGreenAccent),
            padding: const EdgeInsets.all(8.0),
            child: const Icon(Icons.restaurant),
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hoshi Sushi',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                '6391 Elgin St. Celina, Delaware 10299',
                style: Theme.of(context).textTheme.labelMedium,
              )
            ],
          )
        ],
      ),
    );
  }
}
