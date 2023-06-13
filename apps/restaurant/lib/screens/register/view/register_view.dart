import 'package:flutter/material.dart';
import 'package:restaurant/screens/register/pages/category/view/category_page.dart';
import 'package:restaurant/screens/register/pages/info/view/info_page.dart';
import 'package:restaurant/screens/register/pages/preview/view/preview_page.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  List<Step> getSteps() => [
        Step(
            title: const Text('Info'),
            content: const InfoPage(),
            isActive: _currentStep >= 0),
        Step(
          title: const Text('Category'),
          content: const CategoryPage(),
          isActive: _currentStep >= 1,
        ),
        Step(
          title: const Text('Preview'),
          content: const PreviewPage(),
          isActive: _currentStep >= 2,
        ),
      ];

  int _currentStep = 0;

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
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep--;
              });
            }
          },
          onStepTapped: (value) => setState(() {
            _currentStep = value;
          }),
        ),
      ),
    );
  }
}
