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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Category", style: Theme.of(context).textTheme.headlineSmall),
            // const SizedBox(height: 5),
            Text("Select your categories...",
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 30),
            Text("Recommended for you!",
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 25,
              children: List.generate(
                3,
                (index) => const OptionPreference(
                  isSelected: false,
                  title: Text("Pizza"),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text("All the categories",
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 25,
              children: List.generate(
                9,
                (index) => const OptionPreference(
                  isSelected: false,
                  title: Text("Pizza"),
                ),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
