import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/base_card.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      elevation: 0,
      height: 60,
      borderRadius: BorderRadius.zero,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey[200]),
                    child: Icon(
                      icon,
                      color: Theme.of(context).disabledColor,
                      size: 20.0,
                    )),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 13,
              color: Theme.of(context).disabledColor,
            )
          ],
        ),
      ),
    );
  }
}
