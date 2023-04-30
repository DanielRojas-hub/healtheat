import 'package:flutter/material.dart';

class CardFood extends StatelessWidget {
  const CardFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              color: Colors.grey[300],
            ),
            Text('Paella sin arroz',
                style: Theme.of(context).textTheme.titleLarge),
            Text('Promedio', style: Theme.of(context).textTheme.bodyMedium),
            Center(
              child: Container(
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                    child: Text(
                  '\$99',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                )),
              ),
            )
          ]),
    );
  }
}
