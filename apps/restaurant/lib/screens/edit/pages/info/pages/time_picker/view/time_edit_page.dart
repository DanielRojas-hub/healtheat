import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/edit/pages/info/pages/time_picker/view/time_edit_view.dart';

import '../cubit/time_cubit.dart';

enum TimePickerEditType { open, close }

class TimeEditPage extends StatelessWidget {
  const TimeEditPage(
      {super.key, this.initTime, required this.timePickerEditType});
  final TimePickerEditType timePickerEditType;
  final String? initTime;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TimeCubit>(
            create: (context) => TimeCubit(initTime: initTime))
      ],
      child: TimeEditView(
        timePickerEditType: timePickerEditType,
      ),
    );
  }
}
