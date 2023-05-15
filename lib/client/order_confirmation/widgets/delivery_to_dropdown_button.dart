import 'package:flutter/material.dart';
import 'package:healtheat/common/utils/input_border.dart';
import 'package:healtheat/common/widgets/custom_background_widget.dart';

class DeliveryToDropdownButton extends StatelessWidget {
  const DeliveryToDropdownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: DropdownButtonFormField(
        decoration: inputDecorationBorderMethod(context).copyWith(
          isDense: true,
          contentPadding: const EdgeInsets.all(6.0),
        ),
        value: '6391 Elgin St. Celina, Delaware 10299',
        onChanged: (String? newValue) {},
        items: <String>[
          '6391 Elgin St. Celina, Delaware 10299',
          'Cat',
          'Tiger',
          'Lion'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          );
        }).toList(),
      ),
    );
  }
}
