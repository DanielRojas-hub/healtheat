import 'package:flutter/material.dart';
import 'package:restaurant/screens/register/pages/category/widgets/schedule_input.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        children: [
          const SizedBox(height: 50),
          Center(
            child: Text("HealthEat",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                    )),
          ),
          const SizedBox(height: 50),
          const TextField(
            decoration: InputDecoration(label: Text("Restaurant's name")),
          ),
          const SizedBox(height: 30),
          const TextField(
            decoration: InputDecoration(label: Text("Address")),
          ),
          const SizedBox(height: 30),
          Text("Phone number", style: Theme.of(context).textTheme.labelLarge),
          Row(children: [
            Text("+", style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(width: 10),
            const SizedBox(
              width: 50,
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                // decoration: InputDecoration(label: Text("Address")),
              ),
            ),
            const SizedBox(width: 20),
            const Expanded(
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
              ),
            ),
          ]),
          const SizedBox(height: 30),
          Text("Schedule", style: Theme.of(context).textTheme.labelLarge),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScheduleInput(label: 'Opening Time'),
              SizedBox(width: 30),
              ScheduleInput(label: 'Closing Time'),
            ],
          ),
        ],
      ),
    ));
  }
}
