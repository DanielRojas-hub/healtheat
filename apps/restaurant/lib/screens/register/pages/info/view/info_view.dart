import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_repository/restaurant_repository.dart';
import 'dart:io';
import '../widgets/widgets.dart';

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InfoViewState createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Basic Information",
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 15),
        Text("Name", style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 5),
        const NameInput(),
        const SizedBox(height: 20),
        Text("Address", style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 5),
        const AddressInput(),
        const SizedBox(height: 20),
        Text("Phone Number", style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 5),
        Row(
          children: [
            SizedBox(
                width: (MediaQuery.of(context).size.width) / 4,
                child: const CodeInput()),
            const SizedBox(width: 10),
            const Expanded(child: PhoneInput()),
          ],
        ),
        const SizedBox(height: 20),
        Text("Schedule", style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 5),
        const OpeningTimeInput(),
        const SizedBox(height: 15),
        const ClosingTimeInput(),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () async {
                _selectImage();
                // await restaurantRepository.uploadRestaurantImage(
                //     filePath: _image.toString(), fileName: 'id1');
              },
              child: const Text('Upload image'),
            ),
            if (_image != null) ...[
              const SizedBox(height: 10),
              RestaurantImage(image: _image),
            ],
          ],
        ),
      ],
    );
  }
}
