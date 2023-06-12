import 'package:common/widgets/custom_preference.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          // padding: const EdgeInsets.symmetric(horizontal: 30),
          children: [
            const SizedBox(height: 25),
            Center(
              child: Text('HealthEat',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                      )),
            ),
            const SizedBox(height: 50),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 25,
              children: List.generate(
                15,
                (index) => const OptionPreference(
                  isSelected: false,
                  title: Text("Pizza"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
