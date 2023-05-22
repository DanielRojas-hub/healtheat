import 'package:flutter/material.dart';
import 'package:healtheat/client/profile/widgets/custom_profile_card.dart';
import 'package:healtheat/common/extension/custom_theme_extension.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/custom_divider.dart';
import 'package:healtheat/common/widgets/custom_label_buttom.dart';
import 'package:healtheat/common/widgets/image_container.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[100],
      child: Column(children: [
        // Padding(
        //   padding: const EdgeInsets.only(
        //       right: Constants.margin, top: Constants.margin),
        //   child: Align(
        //     alignment: Alignment.centerRight,
        //     child: CustomIconButton(
        //         onTap: () {},
        //         iconData: Icons.logout,
        //         backgroundColor: context.theme.whiteColor,
        //         borderRadius: BorderRadius.circular(Constants.radiusInfinite),
        //         iconSize: 25.0,
        //         padding: const EdgeInsets.all(6.0),
        //         elevation: 2,
        //         color: Theme.of(context).disabledColor),
        //   ),
        // ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const ImageContainer(
                  url:
                      "https://i.pinimg.com/736x/5c/84/3b/5c843bd1b68bbf8935e6239c301dc342.jpg",
                  height: 75,
                  isCircle: true),
              Text("Anton QPWOERWREGHJ",
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 2),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.location_pin,
                    color: Theme.of(context).disabledColor, size: 16),
                Text("Venezuela, CSS",
                    style: Theme.of(context).textTheme.labelLarge),
              ]),
              const SizedBox(height: 5),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomLabelButton(
                  label: const Text('284'),
                  color: context.theme.blackColor,
                  icon: Icons.motorcycle,
                  iconColor: Theme.of(context).primaryColor,
                  backgroundColor: Theme.of(context).cardColor,
                ),
                const SizedBox(width: 10),
                CustomLabelButton(
                  label: const Text('4.5'),
                  color: context.theme.blackColor,
                  icon: Icons.star,
                  iconColor: Theme.of(context).primaryColor,
                  backgroundColor: Theme.of(context).cardColor,
                ),
              ]),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 35),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(Constants.radiusLarge)),
              color: Theme.of(context).cardColor),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 6),
              child: Text("General",
                  style: Theme.of(context).textTheme.labelLarge),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Column(children: [
                  CustomProfileCard(
                      title: "My orders", icon: Icons.motorcycle, onTap: () {}),
                  const CustomDivider(
                    height: 1.5,
                    margin: EdgeInsets.symmetric(horizontal: Constants.margin),
                  )
                ]);
              },
              itemCount: 4,
            ),
          ]),
        )
      ]),
    );
  }
}
