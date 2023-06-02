import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healtheat/common/services/cart/cart_bloc.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/custom_background_widget.dart';
import 'package:healtheat/common/widgets/custom_divider.dart';
import 'package:healtheat/common/widgets/dotted_divider.dart';

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
            if (state.status == CartStatus.empty) {
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
            if (state.status == CartStatus.failure) {
              return const SizedBox();
            }
            return Material(
              color: Colors.grey[50],
              child: ListView(children: const [
                CartList(),
                CustomBackgroundWidget(
                    child:
                        CustomDivider(margin: EdgeInsets.only(bottom: 15.0))),
                CartTotal(),
                CustomBackgroundWidget(
                    child: DottedDivider(padding: EdgeInsets.only(top: 15))),
                SizedBox(height: 100),
              ]),
            );
          },
        ),
      ),
    );
  }
}
