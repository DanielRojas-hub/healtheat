import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:healtheat/client/splash_screen/static/splash_data.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';
import 'package:healtheat/common/router/routes.dart';
import 'package:healtheat/common/widgets/custom_label_buttom.dart';

import '../splash_screen.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(children: [
            Align(
              alignment: Alignment.centerRight,
              child: CustomLabelButton(
                label: Text('Skip',
                    style: Theme.of(context).textTheme.labelMedium),
                backgroundColor:
                    Theme.of(context).colorScheme.tertiaryContainer,
                onTap: () {},
              ),
            ),
            Expanded(
              child: PageView(
                children: List.generate(splashDataList.length, (index) {
                  final splashData = splashDataList[index];
                  return SplashCard(
                      title: splashData.title,
                      description: splashData.description,
                      image: splashData.image);
                }),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(splashDataList.length, (index) {
                final bool selected = index == 0;
                return Container(
                  width: selected ? 15 : 6,
                  height: 6,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: selected
                        ? context.theme.blackColor
                        : Theme.of(context).colorScheme.tertiary,
                  ),
                );
              }),
            ),
            const SizedBox(height: 75),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: ElevatedButton(
                  onPressed: () => context.goNamed(RouteName.home),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).primaryColor)),
                  child: const Text('Get Started')),
            ),
            const SizedBox(height: 25),
          ]),
        ),
      ),
    );
  }
}
