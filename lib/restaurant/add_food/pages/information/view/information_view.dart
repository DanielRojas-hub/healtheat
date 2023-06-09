import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/custom_category_container.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            Center(
              child: Text("New Food",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).primaryColor,
                      )),
            ),
            const SizedBox(height: 30),
            TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'Price',
                suffixIcon: const Icon(Icons.attach_money),
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 30),
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
          ],
        ),
      ),
    );
  }
}
