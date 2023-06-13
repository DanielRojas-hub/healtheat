import 'package:flutter/material.dart';
import 'package:food_repository/food_repository.dart';
import 'package:restaurant/screens/add_food/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class InformationView extends StatefulWidget {
  const InformationView({Key? key}) : super(key: key);

  @override
  _InformationViewState createState() => _InformationViewState();
}

class _InformationViewState extends State<InformationView> {
  File? _image;
  final FoodRepository foodRepository = FoodRepository();

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("New Food", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 20),
          Text(
            'Name',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 5),
          const DisplayNameInput(),
          const SizedBox(height: 30),
          Text(
            'Price',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 5),
          const PriceInput(),
          const SizedBox(height: 30),
          Text(
            'Description',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 5),
          const DescriptionInput(),
          const SizedBox(height: 30),
          Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  _selectImage();
                  await foodRepository.uploadFoodImage(
                      filePath: _image.toString(), fileName: 'id1');
                },
                child: const Text('Upload image'),
              ),
              if (_image != null) ...[
                const SizedBox(height: 10),
                FoodImage(image: _image),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
