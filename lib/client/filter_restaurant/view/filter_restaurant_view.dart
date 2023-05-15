import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/custom_expanded_button.dart';
import 'package:healtheat/common/widgets/custom_label_buttom.dart';

class FilterRestaurantView extends StatelessWidget {
  const FilterRestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            width: 75,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 3,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Categories",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              children: List.generate(
                10,
                (index) {
                  return CustomLabelButton(
                    label: "Burger",
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cuisine",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              children: List.generate(
                8,
                (index) {
                  return CustomLabelButton(
                    label: "Burger",
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Menu",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              children: List.generate(
                7,
                (index) {
                  return CustomLabelButton(
                    label: "Burger",
                    backgroundColor:
                        Theme.of(context).colorScheme.secondaryContainer,
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Show first",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: List.generate(
                4,
                (index) {
                  return Row(
                    children: [
                      CustomLabelButton(
                        label: "",
                        backgroundColor:
                            Theme.of(context).colorScheme.secondaryContainer,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                      const Text("Next to me"),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const ExpandedButton(label: Text("Apply Settings")),
        const ExpandedButton(label: Text("Clean filter")),
      ]),
    );
  }
}
