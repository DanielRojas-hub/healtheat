import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/register/pages/info/pages/time_picker/cubit/time_cubit.dart';
import 'package:restaurant/screens/register/pages/info/pages/time_picker/time_picker.dart';

enum TimePickerType { open, close }

class TimePickerPage extends StatelessWidget {
  const TimePickerPage(
      {super.key, required this.timePickerType, this.initTime});
  final TimePickerType timePickerType;
  final String? initTime;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TimeCubit>(
            create: (context) => TimeCubit(initTime: initTime))
      ],
      child: TimePickerView(
        timePickerType: timePickerType,
      ),
    );
  }
}
