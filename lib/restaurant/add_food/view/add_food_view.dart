import 'package:flutter/material.dart';
import 'package:healtheat/restaurant/add_food/pages/category/category.dart';
import 'package:healtheat/restaurant/add_food/pages/information/information.dart';
import 'package:healtheat/restaurant/add_food/pages/previsualization/previsualization.dart';

class AddFoodView extends StatefulWidget {
  const AddFoodView({super.key});

  @override
  State<AddFoodView> createState() => _AddFoodViewState();
}

class _AddFoodViewState extends State<AddFoodView> {
  final List<Step> _steps = const [
    Step(
      title: Text('Paso 1'),
      content: InformationPage(),
    ),
    Step(
      title: Text('Paso 2'),
      content: CategoryPage(),
    ),
    Step(
      title: Text('Paso 3'),
      content: PrevisualizationPage(),
    ),
  ];

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 249, 249, 249),
        body: Stepper(
          currentStep: _currentStep,
          steps: _steps,
          type: StepperType.horizontal,
          onStepContinue: () {
            if (_currentStep < _steps.length - 1) {
              setState(() {
                _currentStep++;
              });
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep--;
              });
            }
          },
        ),
      ),
    );
  }
}
