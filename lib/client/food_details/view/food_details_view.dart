import 'package:flutter/material.dart';
import 'package:healtheat/client/food_details/widgets/food_info.dart';
import 'package:healtheat/common/widgets/custom_appbar.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        bottomNavigationBar: Text("holis"),
        body: CustomScrollView(
          slivers: [
            CustomAppBar(
                isFavorite: true,
                image:
                    "https://s1.eestatic.com/2021/05/27/como/584453709_186431572_1706x960.jpg",
                height: 275),
            SliverToBoxAdapter(
                child: FoodInfo(
                    title: Text("Sakura Set (1100g)"),
                    price: Text("\$23.69"),
                    subtitle: Text(
                        "El sushi es un plato de la gastronomía japonesa con base de arroz condimentado con vinagre y azúcar"))),
          ],
        ));
  }
}
