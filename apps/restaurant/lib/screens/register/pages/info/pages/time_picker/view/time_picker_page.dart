import 'package:flutter/material.dart';
import 'package:restaurant/screens/register/pages/info/pages/time_picker/time_picker.dart';

enum TimePickerType { open, close }

class TimePickerPage extends StatelessWidget {
  const TimePickerPage({super.key, required this.timePickerType});
  final TimePickerType timePickerType;

  @override
  Widget build(BuildContext context) {
    return TimePickerView(
      timePickerType: timePickerType,
    );
  }
}
