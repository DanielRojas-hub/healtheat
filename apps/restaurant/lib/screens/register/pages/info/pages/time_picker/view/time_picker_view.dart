import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/screens/register/pages/info/pages/time_picker/cubit/time_cubit.dart';
import 'package:restaurant/screens/register/pages/info/pages/time_picker/view/time_picker_page.dart';

class TimePickerView extends StatelessWidget {
  const TimePickerView({super.key, required this.timePickerType});
  final TimePickerType timePickerType;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimeCubit, TimeState>(
      buildWhen: (previous, current) => previous.time != current.time,
      builder: (context, state) {
        return Material(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 20),
                hourMinute12H(context),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => context.pop(state.time),
                        child: const Text('Set Time'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String get label {
    switch (timePickerType) {
      case TimePickerType.open:
        return "Choose opening time";
      case TimePickerType.close:
        return "Choose closing time";
    }
  }
}

Widget hourMinute12H(BuildContext context) {
  return TimePickerSpinner(
    is24HourMode: false,
    onTimeChange: (time) => context.read<TimeCubit>().timeChanged(time),
    time: context.read<TimeCubit>().state.time,
  );
}
