import 'package:flutter/material.dart';
import 'package:healtheat/client/profile/widgets/custom_profile_card.dart';

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
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return CustomProfileCard(
                    title: "My orders :)", icon: "motorcycle", onTap: () {});
              },
              itemCount: 4,
            )
          ],
        ));
  }
}
