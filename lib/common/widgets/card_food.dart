import 'package:flutter/material.dart';

class CardFood extends StatelessWidget {
  const CardFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 300,
      color: Colors.blue,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 100,
          color: Colors.grey[300],
        ),
        Text(
          'Paella sin arroz',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          'Promedio',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Center(
          child: Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
                color: Colors.orange, borderRadius: BorderRadius.circular(100)),
            child: Text('\$99'),
          ),
        )
      ]),
    );
  }
}
