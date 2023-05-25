import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healtheat/common/services/cart/cart_bloc.dart';
import 'package:healtheat/common/services/food/food_bloc.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/custom_background_widget.dart';
import 'package:healtheat/common/widgets/custom_divider.dart';
import 'package:healtheat/common/widgets/dotted_divider.dart';
import 'package:healtheat/common/widgets/total_card.dart';

import '../cart.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const CartFloatingActionButton(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.margin),
        child: BlocBuilder<CartBloc, CartState>(
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) {
            if (state.status == CartStatus.notEmpty) {
              return Material(
                color: Colors.grey[50],
                child: ListView(
                  children: const [
                    CartList(),
                    CustomBackgroundWidget(
                        child: CustomDivider(
                            margin: EdgeInsets.only(bottom: 15.0))),
                    /* DeliveryCard(),
                    CustomBackgroundWidget(child: CustomDivider()), */
                    NewWidget(),
                    CustomBackgroundWidget(
                        child:
                            DottedDivider(padding: EdgeInsets.only(top: 15))),
                    SizedBox(height: 100),
                  ],
                ),
              );
            } else if (state.status == CartStatus.notEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SvgPicture.asset(
                        'assets/images/undraw_empty_cart_co35.svg',
                        height: MediaQuery.of(context).size.height * 0.4),
                  ),
                  const SizedBox(height: 20),
                  Text('Ups... Empty Cart!',
                      style: Theme.of(context).textTheme.headlineMedium)
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        final petitions = state.cart.petitions;

        return BlocBuilder<FoodBloc, FoodState>(
          builder: (context, state) {
            if (state is FoodsLoaded) {
              final foods = state.foods;

              num sum = 0;
              for (var food in foods) {
                for (var petition in petitions) {
                  if (food.id == petition.foodId) {
                    sum += (food.price ?? 0) * petition.quantity;
                  }
                }
              }

              return TotalCard(label: Text(sum.toString()));
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
