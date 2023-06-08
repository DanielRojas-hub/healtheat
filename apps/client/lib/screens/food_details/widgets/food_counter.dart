import 'package:common/services/services.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodCounter extends StatelessWidget {
  const FoodCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, int>(
      builder: (context, state) {
        return CounterWidget(
          label: Text(state.toString()),
          iconSize: 30,
          fontSize: 22,
          onIncrease: () =>
              context.read<CounterBloc>()..add(IncrementCounter()),
          onDecrease: state - 1 > 0
              ? () => context.read<CounterBloc>()..add(DecrementCounter())
              : null,
          labelPadding: const EdgeInsets.symmetric(horizontal: 15.0),
          iconPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        );
      },
    );
  }
}
