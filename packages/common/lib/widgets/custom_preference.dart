import 'package:common/widgets/base_card.dart';
import 'package:common/widgets/image_container.dart';
import 'package:flutter/material.dart';

class OptionPreference extends StatelessWidget {
  const OptionPreference({
    super.key,
    required this.title,
    this.subtitle,
    required this.isSelected,
  });

  final Widget title;
  final Widget? subtitle;
  final bool isSelected;
  // final Preference preference;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      width: 70,
      // onTap: () => isSelected
      //     ? context.read<SelectPreferencesCubit>().removePreference(preference)
      //     : context.read<SelectPreferencesCubit>().insertPreference(preference),
      border: isSelected
          ? Border.all(color: Theme.of(context).primaryColor, width: 2)
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Column(children: [
          const ImageContainer(
              imageUrl:
                  'https://i.pinimg.com/564x/83/01/de/8301dea2b186473f95bdae072c04d88a.jpg',
              // imageUrl:
              //     'https://cdn-icons-png.flaticon.com/512/3637/3637808.png',
              height: 45,
              width: 45,
              isCircle: true),
          const SizedBox(height: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTextStyle.merge(
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color:
                          isSelected ? Theme.of(context).primaryColor : null),
                  child: title),
              // DefaultTextStyle.merge(
              //     style: Theme.of(context).textTheme.labelMedium,
              //     child: subtitle),
            ],
          )
        ]),
      ),
    );
  }
}
