import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_repository/food_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/router/route_name.dart';
import 'package:restaurant/screens/edit_food/edit_food.dart';
import 'package:restaurant/screens/edit_food/pages/information/information.dart';
import 'package:restaurant/screens/edit_food/pages/previsualization/previsualization.dart';
import 'package:restaurant/screens/edit_food/pages/category/category.dart';

class EditFoodView extends StatefulWidget {
  const EditFoodView({
    super.key,
    required this.restaurantId,
    required this.foodId,
  });

  final String? restaurantId;
  final String? foodId;

  @override
  State<EditFoodView> createState() => _EditFoodViewState();
}

class _EditFoodViewState extends State<EditFoodView> {
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
              'Personalize',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blueGrey,
              ),
            ),
            content: const CategoryPage(),
            isActive: _currentStep >= 1),
        Step(
            title: const Text(
              'Prev',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blueGrey,
              ),
            ),
            content: const PrevisualizationPage(),
            isActive: _currentStep >= 2),
      ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFoodCubit, EditFoodState>(
      builder: (context, state) => state.isRestarting
          ? const SizedBox()
          : SafeArea(
              child: Scaffold(
                backgroundColor: const Color.fromARGB(255, 249, 249, 249),
                body: Stepper(
                  currentStep: _currentStep,
                  steps: getSteps(),
                  type: StepperType.horizontal,
                  onStepContinue: !state.isValid && _currentStep == 2
                      ? null
                      : () async {
                          if (_currentStep < getSteps().length - 1) {
                            setState(() {
                              _currentStep++;
                            });
                          } else if (_currentStep == getSteps().length - 1) {
                            Food food = Food(
                                restaurantId: widget.restaurantId ??
                                    '28LecpHZyk81KUl6EsND',
                                displayName: state.displayName.value,
                                description: state.description.value,
                                imageUrl: '',
                                price: num.parse(state.price.value),
                                isAvailable: true,
                                categoryIds: state.categoryIds,
                                menuIds: state.menuIds,
                                preferenceIds: state.preferenceIds);
                            try {
                              String imageUrl = await foodRepository
                                  .uploadFoodImage(state.image!);
                              food = food.copyWith(imageUrl: imageUrl);
                            } catch (e) {
                              print(e);
                            }
                            foodRepository.createFood(
                                widget.restaurantId ?? '28LecpHZyk81KUl6EsND',
                                food);
                            context.goNamed(
                              RouteName.home,
                              pathParameters: {
                                'restaurantId': widget.restaurantId ??
                                    '28LecpHZyk81KUl6EsND'
                              },
                            );
                            // ))
                          }
                        },
                  onStepCancel: () {
                    if (_currentStep > 0) {
                      setState(() {
                        _currentStep--;
                      });
                    } else {
                      Navigator.pop(context);
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
