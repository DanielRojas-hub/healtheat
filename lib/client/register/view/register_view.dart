import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(height: 50),
              Center(
                child: Text("LOGO AQUI",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: Theme.of(context).primaryColor,
                        )),
              ),
              const SizedBox(height: 50),
              const TextField(
                decoration: InputDecoration(label: Text("First name")),
              ),
              const TextField(
                decoration: InputDecoration(label: Text("Last name")),
              ),
              const TextField(
                decoration: InputDecoration(
                    label: Text("Email"), suffixIcon: Icon(Icons.email)),
              ),
              const TextField(
                decoration: InputDecoration(
                    label: Text("Password"), suffixIcon: Icon(Icons.password)),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor)),
                child: const Text("Register"),
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
              const SizedBox(height: 15),
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
                  Text('Register with Google',
                      style: Theme.of(context).textTheme.labelLarge),
                ]),
              ),
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
      ),
    );
  }
}
