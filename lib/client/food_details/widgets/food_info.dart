import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healtheat/common/services/counter/counter_cubit.dart';
import 'package:healtheat/common/widgets/counter_widget.dart';

class FoodInfo extends StatelessWidget {
  const FoodInfo(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.price});
  final Widget title;
  final Widget price;
  final Widget subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            DefaultTextStyle.merge(
                style: Theme.of(context).textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                child: title),
            DefaultTextStyle.merge(
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                child: price),
            const SizedBox(height: 15),
            DefaultTextStyle.merge(
                style: Theme.of(context).textTheme.labelLarge, child: subtitle),
          ]),
          const SizedBox(height: 50),
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return CounterWidget(
                label: Text(state.toString()),
                iconSize: 30,
                fontSize: 22,
                onIncrease: () => context.read<CounterCubit>().increment(),
                onDecrease: state - 1 > 0
                    ? () => context.read<CounterCubit>().decrement()
                    : null,
                labelPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                iconPadding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              );
            },
          )
        ],
      ),
    );
  }
}
