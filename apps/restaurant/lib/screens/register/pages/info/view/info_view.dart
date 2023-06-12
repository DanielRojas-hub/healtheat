import 'package:common/utils/constants.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/router/route_name.dart';
import 'package:common/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InfoViewState createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
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

  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        // padding: const EdgeInsets.symmetric(horizontal: 30),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Text("HealthEat",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                    )),
          ),
          const SizedBox(height: 50),
          Text("Name", style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 5),
          const CustomTextField(
            icon: Icon(Icons.storefront, size: 20),
          ),
          const SizedBox(height: 20),
          Text("Address", style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 5),
          const CustomTextField(
            icon: Icon(Icons.location_on, size: 20),
          ),
          const SizedBox(height: 20),
          Text("Phone Number", style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 5),
          Row(
            children: [
              SizedBox(
                  width: (MediaQuery.of(context).size.width) / 4,
                  child: CustomTextField(
                      prefixText: "+",
                      readOnly: true,
                      onTap: () => showCountryPicker(
                            context: context,
                            onSelect: (value) {},
                          ))),
              const SizedBox(width: 10),
              const Expanded(
                  child: CustomTextField(
                textInputType: TextInputType.number,
              )),
            ],
          ),
          const SizedBox(height: 20),
          Text("Schedule", style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 5),
          CustomTextField(
            readOnly: true,
            prefixText: 'Opening time',
            icon: const Icon(Icons.schedule, size: 20),
            onTap: () => context.goNamed(RouteName.timePicker,
                queryParameters: {'type': 'open'}),
          ),
          const SizedBox(height: 15),
          CustomTextField(
            readOnly: true,
            prefixText: 'Closing time',
            icon: const Icon(Icons.schedule, size: 20),
            onTap: () => context.goNamed(RouteName.timePicker,
                queryParameters: {'type': 'close'}),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomIconButton(
                onTap: () {
                  _selectImage();
                },
                iconData: Icons.add_a_photo,
                borderRadius: BorderRadius.circular(100),
                padding: const EdgeInsets.all(15),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     _selectImage();
              //   },
              //   child: const Text('Add image'),
              // ),
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
