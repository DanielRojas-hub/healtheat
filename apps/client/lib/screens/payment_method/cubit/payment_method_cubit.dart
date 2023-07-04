import 'package:cart_repository/cart_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:food_repository/food_repository.dart';
import 'package:formz/formz.dart';

part 'payment_method_state.dart';

enum PaymentMethod { applePay, paypal, creditCard }

class PaymentMethodCubit extends Cubit<PaymentMethodState> {
  PaymentMethodCubit({FoodRepository? foodRepository})
      : _foodRepository = foodRepository ?? FoodRepository(),
        super(const PaymentMethodState());
  final FoodRepository _foodRepository;
  num total = 0;

  num calculateTotal(List<Food> foods, List<Petition> petitions) {
    num sum = 0;
    for (int i = 0; i < foods.length; i++) {
      final food = foods[i];
      for (int j = 0; j < petitions.length; j++) {
        final petition = petitions[j];
        if (food.id == petition.foodId) {
          sum += (food.price ?? 0) * petition.quantity;
        }
      }
    }
    return sum;
  }

  void select(PaymentMethod paymentMethod) =>
      emit(state.copyWith(paymentMethod: paymentMethod));

  Future<void> submit(context, Cart cart) async {
    final foodIds = List.generate(
        cart.petitions.length, (index) => cart.petitions[index].foodId);
    final foods =
        await _foodRepository.getFoods(cart.restaurantId, foodIds: foodIds);
    List<dynamic> foodsList = [];
    for (var i in foods) {
      foodsList.add({
        "name": i.displayName,
        "quantity": cart.petitions
            .firstWhere((element) => element.foodId == i.id)
            .quantity,
        "price": i.price.toString(),
        "currency": "USD"
      });
    }
    total = calculateTotal(foods, cart.petitions);
    print(cart.petitions);
    switch (state.paymentMethod) {
      case PaymentMethod.applePay:
        print('Apple Pay');
        break;
      case PaymentMethod.paypal:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => UsePaypal(
                sandboxMode: true,
                clientId:
                    "AfdOoVuUgC3GS87qCF-teqtW1bK4BsC7frfdRMohsXpr4wJr-L4Dt0UE5BjwY781rytppkKJpd95Wqac",
                secretKey:
                    "EPEQzlHSDsKksyI1jHQ_hqEhwr9cHh5aI0AAJtjrhnghhFK3jawt5KwL7cGsF6BaNWinxzgMj5RPXgeb",
                returnURL: "https://samplesite.com/return",
                cancelURL: "https://samplesite.com/cancel",
                transactions: [
                  {
                    "amount": {
                      "total": total.toString(),
                      "currency": "USD",
                      "details": {
                        "subtotal": total.toString(),
                        "shipping": '0',
                        "shipping_discount": 0
                      }
                    },
                    "description": "Compra HealthEat",
                    // "payment_options": {
                    //   "allowed_payment_method":
                    //       "INSTANT_FUNDING_SOURCE"
                    // },
                    "item_list": {
                      "items": foodsList,

                      // shipping address is not required though
                      /*"shipping_address": {
                                "recipient_name": "Jane Foster",
                                "line1": "Travis County",
                                "line2": "",
                                "city": "Austin",
                                "country_code": "US",
                                "postal_code": "73301",
                                "phone": "+00000000",
                                "state": "Texas"
                              },*/
                    }
                  }
                ],
                note: "Contact us for any questions on your order.",
                onSuccess: (Map params) async {
                  print("onSuccess: $params");
                  emit(state.copyWith(status: FormzSubmissionStatus.success));
                  print('TRRRRRRRRRRRRRRRRRUUUUUUUUUUUUUUUUEEEEEEEEEEEEEEEEE');
                },
                onError: (error) {
                  print("onError: $error");
                  print(
                      'FAAAAAAAAAAAAAAAALLLLLLLLLLLSSSSSSSSSSSSSSEEEEEEEEEEEE');
                },
                onCancel: (params) {
                  print('cancelled: $params');
                  print(
                      'FAAAAAAAAAAAAAAAALLLLLLLLLLLSSSSSSSSSSSSSSEEEEEEEEEEEE');
                }),
          ),
        );
        // print('AQUIAUQIAIAUSIAOQIIIIII: $a');
        break;

      case PaymentMethod.creditCard:
        print('Credit Card');
        break;
    }
    emit(state.copyWith(status: FormzSubmissionStatus.failure));
  }
}
