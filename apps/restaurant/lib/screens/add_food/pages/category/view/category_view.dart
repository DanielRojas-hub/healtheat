import 'package:common/widgets/custom_category_container.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      child: ListView(
        children: [
          Row(
            children: [
              Text(
                'Categories',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    '+ New category',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          CategoryContainer(
            iconData: Icons.eco,
            label: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).hintColor),
            ),
          ),
          const SizedBox(height: 15),
          CategoryContainer(
            iconData: Icons.breakfast_dining,
            label: Text(
              'Gluten free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).hintColor),
            ),
          ),
          const SizedBox(height: 15),
          CategoryContainer(
            iconData: Icons.breakfast_dining,
            label: Text(
              'Gluten free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).hintColor),
            ),
          ),
        ],
      ),
    );
  }
}
