import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/custom_background_widget.dart';

class DeliveryToDropdownButton extends StatelessWidget {
  const DeliveryToDropdownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.all(6.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300, width: 2),
          ),
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
