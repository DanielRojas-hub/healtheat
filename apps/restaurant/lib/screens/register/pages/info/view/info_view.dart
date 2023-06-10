import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/router/route_name.dart';
import 'package:common/widgets/widgets.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            children: [
              const SizedBox(height: 50),
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
              Text("Phone Number",
                  style: Theme.of(context).textTheme.labelLarge),
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
              )
            ],
          ),
        ));
  }
}
