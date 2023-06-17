import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/screens/register/pages/category/view/category_page.dart';
import 'package:restaurant/screens/register/pages/info/view/info_page.dart';
import 'package:restaurant/screens/register/register.dart';
import 'package:restaurant_repository/restaurant_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  void showColoredToast() {
    Fluttertoast.showToast(
        msg: "This is Colored Toast with android duration of 5 Sec",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

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

  final RestaurantRepository restaurantRepository = RestaurantRepository();
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
              onStepContinue: () async {
                if (_currentStep < getSteps().length - 1) {
                  setState(() {
                    _currentStep++;
                  });
                } else {
                  await restaurantRepository.uploadRestaurantImage(
                      filePath: state.image.toString(), fileName: 'id1');
                  String imageUrl =
                      await restaurantRepository.downloadURL('id1');
                  final Restaurant restaurant = Restaurant(
                    displayName: state.name.value,
                    address: state.address.value,
                    categoryIds: state.categoryIds,
                    closeTime: state.closingTime.value,
                    cuisineIds: state.cuisineIds,
                    deliveryPriceRange: '',
                    deliveryTimeRange: '',
                    imageUrl: imageUrl,
                    menuIds: state.menuIds,
                    openTime: state.openingTime.value,
                    phoneNumber: '',
                    preferenceIds: state.preferenceIds,
                    rating: null,
                  );
                  restaurantRepository.createRestaurant(restaurant);
                  GoRouter.of(context).go('/add_food');
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                      backgroundColor: Theme.of(context).primaryColor,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(state.errorMessage ?? 'Restaurant creation'),
                          Icon(
                            Icons.done,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ],
                      ),
                    ));

                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => ToastContext(),
                  // ));
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
