import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

import '../payment_method.dart';

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Method'), centerTitle: true),
      floatingActionButton: const PaymentMethodFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
        child: Material(
          color: Colors.grey[50],
          child: ListView(children: [
            const SizedBox(height: 20),
            const PaymentList(),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => {
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
                            "description":
                                "The payment transaction description.",
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
                )
              },
              child: Text('Pagar con Paypal'),
            ),
          ]),
        ),
      ),
    );
  }
}
