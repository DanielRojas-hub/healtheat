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
  final List<Step> _steps = const [
    Step(
      title: Text('Info'),
      content: InfoPage(),
    ),
    Step(
      title: Text('Category'),
      content: CategoryPage(),
    ),
    Step(
      title: Text('Preview'),
      content: PreviewPage(),
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
