import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const TextField(
              decoration: InputDecoration(
                label: Text("Email"),
                suffixIcon: Icon(Icons.email),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                label: Text("Password"),
                suffixIcon: Icon(Icons.password),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).primaryColor)),
                child: const Text("Log in"),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 1.0,
                    color: Theme.of(context).disabledColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('OR',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).disabledColor,
                          )),
                ),
                Expanded(
                  child: Container(
                    height: 1.0,
                    color: Theme.of(context).disabledColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Theme.of(context).cardColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          './assets/icons/google_logo.png',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Sign in with Google',
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Theme.of(context).disabledColor,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).disabledColor,
                    ),
                children: [
                  TextSpan(
                    text: 'Click here',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
