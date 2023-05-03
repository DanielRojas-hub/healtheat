import 'package:flutter/material.dart';
import 'package:healtheat/client/splash_screen/static/splash_data.dart';
import 'package:healtheat/common/widgets/custom_label_buttom.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.keyboard_backspace,
                    size: 30,
                    color: Theme.of(context).disabledColor,
                  ),
                  CustomLabelButtom(
                    title: 'Skip',
                    backgroundColor: Theme.of(context).disabledColor,
                    onTap: () {},
                  ),
                ],
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(splashDataList.length, (index) {
                  final bool selected = index == 0;
                  return Container(
                    width: selected ? 15 : 8,
                    height: 8,
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: selected
                          ? Colors.black
                          : Theme.of(context).disabledColor,
                    ),
                  );
                }),
              ),
              SizedBox(height: 75),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor),
                  ),
                  child: Text(
                    'Get Started',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
              SizedBox(height: 75),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashCard extends StatelessWidget {
  const SplashCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: SvgPicture.asset(image)),
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(
          description,
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).disabledColor,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
