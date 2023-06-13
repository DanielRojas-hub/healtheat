import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/register/pages/category/view/category_page.dart';
import 'package:restaurant/screens/register/pages/info/view/info_page.dart';
import 'package:restaurant/screens/register/register.dart';
import 'package:restaurant_repository/restaurant_repository.dart';

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
          title: const Text('Personalization'),
          content: const CategoryPage(),
          isActive: _currentStep >= 1,
        ),
        // Step(
        //   title: const Text('Preview'),
        //   content: const PreviewPage(),
        //   isActive: _currentStep >= 2,
        // ),
      ];

  int _currentStep = 0;

  final RestaurantRepository _restaurantRepository = RestaurantRepository();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
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
                } else {
                  final Restaurant restaurant = Restaurant(
                    displayName: state.name.value,
                    address: state.address.value,
                    categoryIds: state.categoryIds,
                    closeTime: state.closingTime.value,
                    cuisineIds: state.cuisineIds,
                    deliveryPriceRange: '',
                    deliveryTimeRange: '',
                    imageUrl:
                        'https://media-cdn.tripadvisor.com/media/photo-s/02/ff/82/8d/patio-view.jpg',
                    menuIds: state.menuIds,
                    openTime: state.openingTime.value,
                    phoneNumber: '',
                    preferenceIds: [],
                    rating: null,
                  );
                  _restaurantRepository.createRestaurant(restaurant);
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
      },
    );
  }
}
