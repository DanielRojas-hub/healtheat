import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(Theme.of(context).cardColor)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset('./assets/icons/google_logo.png', width: 20, height: 20),
        const SizedBox(width: 10),
        Text('Sign in with Google',
            style: Theme.of(context).textTheme.labelLarge),
      ]),
    );
  }
}
