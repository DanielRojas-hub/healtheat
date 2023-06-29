import 'package:common/services/restaurant/restaurant_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_repository/restaurant_repository.dart';
import 'dart:io';

import '../widgets/restaurant_image.dart';

class ImageView extends StatefulWidget {
  const ImageView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InfoViewState createState() => _InfoViewState();
}

class _InfoViewState extends State<ImageView> {
  File? _image;
  final RestaurantRepository restaurantRepository = RestaurantRepository();

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RestaurantBloc, RestaurantState>(
      builder: (context, state) {
        if (state is RestaurantLoaded) {
          final restaurant = state.restaurant;
          String? image_before = restaurant.imageUrl;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (image_before != "") ...[
                const SizedBox(height: 10),
                RestaurantImage(image: File(image_before!)),
              ],
              ElevatedButton(
                onPressed: () async {
                  _selectImage();
                },
                child: const Text('Upload image'),
              ),
              if (_image != null) ...[
                const SizedBox(height: 10),
                RestaurantImage(image: _image),
              ],
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
