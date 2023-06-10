import 'package:flutter/material.dart';

class ScheduleInput extends StatelessWidget {
  const ScheduleInput({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child: const SizedBox(
                width: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(":", style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(width: 10),
            const SizedBox(
              width: 50,
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                // decoration: InputDecoration(label: Text("Closing time")),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
