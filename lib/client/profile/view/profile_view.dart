import 'package:flutter/material.dart';
import 'package:healtheat/client/profile/widgets/custom_profile_card.dart';
import 'package:healtheat/common/utils/constants.dart';
import 'package:healtheat/common/widgets/custom_divider.dart';

class ProfileView extends StatelessWidget {
  // const ProfileView({Key? key}) : super(key: key);
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(),
        body: ListView(
          shrinkWrap: true,
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return CustomProfileCard(
                    title: "My orders", icon: Icons.motorcycle, onTap: () {});
              },
              itemCount: 4,
              separatorBuilder: (BuildContext context, int index) {
                return CustomDivider(
                  height: 1.5,
                  margin: EdgeInsets.symmetric(horizontal: Constants.margin),
                );
              },
            )
          ],
        ));
  }
}
