import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';

import 'base_card.dart';

class Shift extends Equatable {
  final String title;

  const Shift(this.title);

  @override
  List<Object?> get props => [title];
}

class ShiftWidget extends StatelessWidget {
  const ShiftWidget(
      {Key? key,
      required this.shiftList,
      required this.selectedShift,
      required this.onTap})
      : super(key: key);

  final List<Shift> shiftList;
  final Shift selectedShift;
  final void Function(Shift selectedShift) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(shiftList.length, (index) {
      final shift = shiftList[index];
      final isSelected = selectedShift == shift;

      return Expanded(
        child:
            SelectionOption(shift: shift, isSelected: isSelected, onTap: onTap),
      );
    }));
  }
}

class SelectionOption extends StatelessWidget {
  const SelectionOption(
      {Key? key,
      required this.shift,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  final Shift shift;
  final bool isSelected;
  final void Function(Shift selectedShift) onTap;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      elevation: 0,
      borderRadius: BorderRadius.zero,
      backgroundColor: Colors.transparent,
      onTap: () => onTap(shift),
      child: Container(
        decoration: BoxDecoration(
            border: isSelected
                ? Border(
                    bottom: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2.5))
                : null),
        child: Center(
          child: Text(
            shift.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : context.theme.blackColor),
          ),
        ),
      ),
    );
  }
}
