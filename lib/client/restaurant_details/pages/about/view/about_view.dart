import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/custom_label_buttom.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(Constants.margin),
      children: const [
        InfoAbout(label: Text('0423123123123'), iconData: Icons.phone),
        SizedBox(height: 20),
        InfoAbout(label: Text('0423123123123'), iconData: Icons.phone)
      ],
    );
  }
}

class InfoAbout extends StatelessWidget {
  const InfoAbout({
    super.key,
    required this.iconData,
    required this.label,
  });
  final IconData iconData;
  final Widget label;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(iconData),
      const SizedBox(width: 10),
      DefaultTextStyle.merge(child: label)
    ]);
  }
}
