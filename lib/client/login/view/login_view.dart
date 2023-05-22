import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
              const TextField(
                decoration: InputDecoration(
                    label: Text("Email"), suffixIcon: Icon(Icons.email)),
              ),
              const TextField(
                decoration: InputDecoration(
                    label: Text("Password"), suffixIcon: Icon(Icons.password)),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                child: const Text("LOG IN"),
              ),
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
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).cardColor)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset('./assets/icons/google_logo.png',
                      width: 20, height: 20),
                  const SizedBox(width: 10),
                  Text('Sign in with Google',
                      style: Theme.of(context).textTheme.labelLarge),
                ]),
              ),
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
