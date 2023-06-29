import 'package:common/utils/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant/router/route_name.dart';

import '../sign_up.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.marginSmall),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Sign Up',
                    style: Theme.of(context).textTheme.headlineLarge),
                Text('Please sign in to continue',
                    style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(height: 15.0),
                const DisplayNameInput(),
                const EmailInput(),
                const PasswordInput(),
                const ConfirmPasswordInput(),
                const SizedBox(height: 15),
                const RegisterButton(),
                const SizedBox(height: 20),
                Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "Do you have an account? ",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                        children: [
                          TextSpan(
                            text: 'Click here',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.goNamed(RouteName.login),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
