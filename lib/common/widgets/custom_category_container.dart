import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    Key? key,
    required this.iconData,
    required this.label,
  }) : super(key: key);

  final IconData iconData;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).hoverColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.green,
            size: 50,
          ),
          const SizedBox(width: 8),
          label,
        ],
      ),
    );
  }
}
