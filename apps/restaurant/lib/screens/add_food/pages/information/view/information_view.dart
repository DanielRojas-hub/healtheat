import 'dart:io';

import 'package:common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
      height: 650,
      child: ListView(
        children: [
          Text("New Food",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Theme.of(context).primaryColor,
                  )),
          const SizedBox(height: 20),
          Text("Name", style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 5),
          const CustomTextField(
            icon: Icon(Icons.fastfood, size: 20),
          ),
          const SizedBox(height: 20),
          Text("Price", style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 5),
          const CustomTextField(
            icon: Icon(Icons.attach_money, size: 20),
          ),
          const SizedBox(height: 20),
          Text('Description', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 5),
          const CustomTextField(
            maxLines: 4,
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  _selectImage();
                },
                child: Text('Adjuntar imagen'),
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
