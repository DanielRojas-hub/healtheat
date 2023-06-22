import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../register.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 50),
            // Center(
            //   child: Text("LOGO AQUI",
            //       style: Theme.of(context).textTheme.displayMedium?.copyWith(
            //             color: Theme.of(context).primaryColor,
            //           )),
            // ),
            // const SizedBox(height: 50),
            // const DisplayNameInput(),
            const EmailInput(),
            const PasswordInput(),
            const ConfirmPasswordInput(),
            const SizedBox(height: 15),
            const RegisterButton(),
            const SizedBox(height: 10),
            Row(children: [
              Expanded(
                child: Container(
                    height: 1.0,
                    color: Theme.of(context).colorScheme.tertiaryContainer),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child:
                    Text('OR', style: Theme.of(context).textTheme.labelLarge),
              ),
              Expanded(
                child: Container(
                    height: 1.0,
                    color: Theme.of(context).colorScheme.tertiaryContainer),
              ),
            ]),
            const SizedBox(height: 15),
            const GoogleButton(),
            const SizedBox(height: 15),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "Already have an account? ",
                  style: Theme.of(context).textTheme.labelLarge,
                  children: [
                    TextSpan(
                      text: 'Click here',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ]),
            )
          ]),
    );
  }
}
