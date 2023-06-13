import 'package:flutter/material.dart';
import 'package:common/widgets/custom_background_widget.dart';
import 'package:common/widgets/skelton.dart';

class RestaurantAddressCard extends StatelessWidget {
  const RestaurantAddressCard(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Row(children: [
        Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.lightGreenAccent),
            padding: const EdgeInsets.all(10.0),
            child: const Icon(Icons.restaurant, size: 20)),
        const SizedBox(width: 10.0),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
          ]),
        ),
      ]),
    );
  }
}

class SkeletonRestaurantAddressCard extends StatelessWidget {
  const SkeletonRestaurantAddressCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Row(children: [
        Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.lightGreenAccent),
            padding: const EdgeInsets.all(10.0),
            child: const Icon(Icons.restaurant, size: 20)),
        const SizedBox(width: 10.0),
        const Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skelton(height: 15, width: 100),
                SizedBox(height: 5),
                Skelton(height: 15, width: 200),
              ]),
        ),
      ]),
    );
  }
}
