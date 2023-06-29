// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/screens/edit_food/edit_food.dart';

class FoodImage extends StatelessWidget {
  const FoodImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final File? image;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditFoodCubit, EditFoodState>(
      buildWhen: (previous, current) => previous.image != current.image,
      builder: (context, state) {
        if (image != null) {
          context.read<EditFoodCubit>().imageChanged(image);
          return Image.file(image!);
        }
        return const Text('No hay imagen seleccionada');
      },
    );
  }
}
