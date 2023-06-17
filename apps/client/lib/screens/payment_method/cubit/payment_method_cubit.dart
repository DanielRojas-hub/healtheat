import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

enum PaymentMethod { applePay, paypal, creditCard }

class PaymentMethodCubit extends Cubit<PaymentMethod> {
  PaymentMethodCubit() : super(PaymentMethod.applePay);

  void select(PaymentMethod paymentMethod) => emit(paymentMethod);

  void submit(context) {
    switch (state) {
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
                transactions: const [
                  {
                    "amount": {
                      "total": '10.12',
                      "currency": "USD",
                      "details": {
                        "subtotal": '10.12',
                        "shipping": '0',
                        "shipping_discount": 0
                      }
                    },
                    "description": "The payment transaction description.",
                    // "payment_options": {
                    //   "allowed_payment_method":
                    //       "INSTANT_FUNDING_SOURCE"
                    // },
                    "item_list": {
                      "items": [
                        {
                          "name": "A demo product",
                          "quantity": 1,
                          "price": '10.12',
                          "currency": "USD"
                        }
                      ],

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
                },
                onError: (error) {
                  print("onError: $error");
                },
                onCancel: (params) {
                  print('cancelled: $params');
                }),
          ),
        );
        break;
      case PaymentMethod.creditCard:
        print('Credit Card');
        break;
    }
  }
}
