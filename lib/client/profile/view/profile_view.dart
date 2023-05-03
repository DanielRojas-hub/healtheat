import 'package:flutter/material.dart';
import 'package:healtheat/client/profile/widgets/custom_profile_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(),
        body: const CustomProfileCard());
  }
}
