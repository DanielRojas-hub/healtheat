import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';
import 'package:restaurant/screens/add_food/add_food.dart';
import 'package:restaurant/screens/add_food/pages/information/information.dart';
import 'package:restaurant/screens/add_food/pages/previsualization/previsualization.dart';

class AddFoodView extends StatefulWidget {
  const AddFoodView({super.key, this.restaurantId});

  final String? restaurantId;

  @override
  State<AddFoodView> createState() => _AddFoodViewState();
}

class _AddFoodViewState extends State<AddFoodView> {
  int _currentStep = 0;
  FoodRepository foodRepository = FoodRepository();

  List<Step> getSteps() => [
        Step(
            title: const Text(
              'Information',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blueGrey,
              ),
            ),
            content: const InformationPage(),
            isActive: _currentStep >= 0),
        Step(
            title: const Text(
              'Previsualization',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blueGrey,
              ),
            ),
            content: const PrevisualizationPage(),
            isActive: _currentStep >= 1),
        // Step(
        //     title: const Text(
        //       'Previsualization',
        //       style: TextStyle(
        //         fontSize: 10,
        //         color: Colors.blueGrey,
        //       ),
        //     ),
        //     content: const CategoryPage(),
        //     isActive: _currentStep >= 2),
      ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFoodCubit, AddFoodState>(
      builder: (context, state) => state.isRestarting
          ? const SizedBox()
          : SafeArea(
              child: Scaffold(
                backgroundColor: const Color.fromARGB(255, 249, 249, 249),
                body: Stepper(
                  currentStep: _currentStep,
                  steps: getSteps(),
                  type: StepperType.horizontal,
                  onStepContinue: () async {
                    if (_currentStep < getSteps().length - 1) {
                      setState(() {
                        _currentStep++;
                      });
                    } else if (_currentStep == getSteps().length - 1) {
                      Food food = Food(
                          restaurantId:
                              widget.restaurantId ?? '28LecpHZyk81KUl6EsND',
                          displayName: state.displayName.value,
                          description: state.description.value,
                          imageUrl: '',
                          price: num.parse(state.price.value),
                          isAvailable: true);
                      try {
                        String imageUrl =
                            await foodRepository.uploadFoodImage(state.image!);
                        food = food.copyWith(imageUrl: imageUrl);
                      } catch (e) {
                        print(e);
                      }
                      foodRepository.createFood(
                          widget.restaurantId ?? '28LecpHZyk81KUl6EsND', food);
                      _currentStep = 0;
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
            ),
    );
  }
}
