import 'package:flutter/material.dart';
import 'package:restaurant/screens/add_food/pages/category/category.dart';
import 'package:restaurant/screens/add_food/pages/information/information.dart';
import 'package:restaurant/screens/add_food/pages/previsualization/previsualization.dart';

class AddFoodView extends StatefulWidget {
  const AddFoodView({super.key});

  @override
  State<AddFoodView> createState() => _AddFoodViewState();
}

class _AddFoodViewState extends State<AddFoodView> {
  int _currentStep = 0;

  List<Step> getSteps() => [
        Step(
            title: const Text(
              'Information',
              style: TextStyle(
                fontSize: 10,
                color: Colors.blueGrey,
              ),
            ),
            content: const InformationPage(),
            isActive: _currentStep >= 0),
        Step(
            title: const Text(
              'Categories',
              style: TextStyle(
                fontSize: 10,
                color: Colors.blueGrey,
              ),
            ),
            content: const CategoryPage(),
            isActive: _currentStep >= 1),
        Step(
            title: const Text(
              'Previsualization',
              style: TextStyle(
                fontSize: 10,
                color: Colors.blueGrey,
              ),
            ),
            content: const PrevisualizationPage(),
            isActive: _currentStep >= 2),
      ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 249, 249, 249),
        body: Stepper(
          currentStep: _currentStep,
          steps: getSteps(),
          type: StepperType.horizontal,
          onStepContinue: () {
            if (_currentStep < getSteps().length - 1) {
              setState(() {
                _currentStep++;
              });
            }
          },
          onStepCancel: _currentStep == 0
              ? null
              : () {
                  if (_currentStep > 0) {
                    setState(() {
                      _currentStep--;
                    });
                  }
                },
          onStepTapped: (value) => setState(
            () {
              _currentStep = value;
            },
          ),
        ),
      ),
    );
  }
}
