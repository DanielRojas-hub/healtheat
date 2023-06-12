import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant/screens/add_food/widgets/widgets.dart';

class InformationView extends StatefulWidget {
  const InformationView({Key? key}) : super(key: key);

  @override
  _InformationViewState createState() => _InformationViewState();
}

class _InformationViewState extends State<InformationView> {
  File? _image;

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
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: ListView(
        children: [
          Text("New Food",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Theme.of(context).primaryColor,
                  )),
          const SizedBox(height: 20),
          Text(
            'Name',
            style: TextStyle(color: Theme.of(context).disabledColor),
          ),
          const DisplayNameInput(),
          const SizedBox(height: 30),
          Text(
            'Price',
            style: TextStyle(color: Theme.of(context).disabledColor),
          ),
          const PriceInput(),
          const SizedBox(height: 30),
          Text(
            'Description',
            style: TextStyle(color: Theme.of(context).disabledColor),
          ),
          const DescriptionInput(),
          const SizedBox(height: 30),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  _selectImage();
                },
                child: const Text('Adjuntar imagen'),
              ),
              if (_image != null) ...[
                const SizedBox(height: 10),
                Image.file(_image!),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
