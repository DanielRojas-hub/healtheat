// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:client/router/route_name.dart';
import 'package:common/utils/utils.dart';
import 'package:common/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../login.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    Key? key,
    required this.loginName,
    required this.registerName,
  }) : super(key: key);

  final String loginName;
  final String registerName;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      backgroundColor: Colors.white,
      borderRadius: const BorderRadius.vertical(
          top: Radius.circular(Constants.radiusMedium)),
      child: DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0,
        maxChildSize: 0.75,
        expand: false,
        snap: true,
        builder: (BuildContext context, ScrollController controller) {
          return CustomScrollView(controller: controller, slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: HeaderDelegate(
                  maxHeight: 30,
                  minHeight: 30,
                  backgroundColor: Colors.transparent,
                  child: const HorizontalScrollBar()),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 7.0)),
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Constants.marginSmall),
              sliver: SliverToBoxAdapter(
                  child: Text('Login',
                      style: Theme.of(context).textTheme.headlineLarge)),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 7.0)),
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Constants.marginSmall),
              sliver: SliverToBoxAdapter(
                  child: Text('Please sign in to continue',
                      style: Theme.of(context).textTheme.labelLarge)),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 15)),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: Constants.marginSmall),
              sliver: SliverToBoxAdapter(child: EmailInput()),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: Constants.marginSmall),
              sliver: SliverToBoxAdapter(child: PasswordInput()),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 15)),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: Constants.marginSmall),
              sliver: SliverToBoxAdapter(child: LoginButton()),
            ),
            // const SliverToBoxAdapter(child: SizedBox(height: 10)),
            // SliverPadding(
            //     padding: const EdgeInsets.symmetric(
            //         horizontal: Constants.marginSmall),
            //     sliver: SliverToBoxAdapter(
            //       child: Row(children: [
            //         Expanded(
            //           child: Container(
            //               height: 1.0,
            //               color:
            //                   Theme.of(context).colorScheme.tertiaryContainer),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 8.0),
            //           child: Text('OR',
            //               style: Theme.of(context).textTheme.labelLarge),
            //         ),
            //         Expanded(
            //           child: Container(
            //               height: 1.0,
            //               color:
            //                   Theme.of(context).colorScheme.tertiaryContainer),
            //         ),
            //       ]),
            //     )),
            // const SliverToBoxAdapter(child: SizedBox(height: 10)),
            // const SliverPadding(
            //   padding: EdgeInsets.symmetric(horizontal: Constants.marginSmall),
            //   sliver: SliverToBoxAdapter(child: GoogleButton()),
            // ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Constants.marginSmall),
              sliver: SliverToBoxAdapter(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Don't have an account? ",
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
                            ..onTap = () {
                              context.pop();
                              context.pushNamed(registerName, extra: loginName);
                            },
                        ),
                      ]),
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
