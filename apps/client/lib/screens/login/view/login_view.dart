import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../login.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(height: 100),
              Center(
                child: Text("LOGO AQUI",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                        )),
              ),
              const SizedBox(height: 40),
              const EmailInput(),
              const PasswordInput(),
              const SizedBox(height: 40),
              const LoginButton(),
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
              const SizedBox(height: 10),
              const GoogleButton(),
              const SizedBox(height: 20),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Don't have an account? ",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                    children: [
                      TextSpan(
                        text: 'Click here',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ]),
              ),
            ]),
      ),
    );
  }
}
