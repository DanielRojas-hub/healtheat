import 'package:flutter/material.dart';

class CartFloatingActionButton extends StatelessWidget {
  const CartFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42.5,
      child: FloatingActionButton.extended(
        onPressed: () {},
        label: SizedBox(
          width: 4 * MediaQuery.of(context).size.width / 5,
          child: Row(
            children: [
              Icon(Icons.schedule,
                  size: 20, color: Theme.of(context).colorScheme.onPrimary),
              const SizedBox(width: 10),
              Expanded(
                  child: Text(
                '20-25 min',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              )),
              Text(
                'Checkout',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
