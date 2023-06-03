import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/base_card.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.buttonChild,
      this.onPressed});

  final Widget title;
  final Widget subtitle;
  final Widget buttonChild;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      borderRadius: BorderRadius.zero,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: [
          Expanded(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultTextStyle.merge(
                      style: Theme.of(context).textTheme.labelLarge,
                      child: title),
                  DefaultTextStyle.merge(
                      style: Theme.of(context).textTheme.titleLarge,
                      child: subtitle)
                ]),
          ),
          const SizedBox(width: 20),
          Expanded(
              flex: 2,
              child: ElevatedButton(onPressed: onPressed, child: buttonChild))
        ]),
      ),
    );
  }
}
