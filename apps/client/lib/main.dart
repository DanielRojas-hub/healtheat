import 'package:authentication_repository/authentication_repository.dart';
import 'package:cart_repository/cart_repository.dart';
import 'package:common/services/services.dart';
import 'package:common/themes/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.authUser.first;

  runApp(MyApp(authenticationRepository: authenticationRepository));
}

class MyApp extends StatelessWidget {
  const MyApp({
    required AuthenticationRepository authenticationRepository,
    super.key,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  // This widget is the root of your application .
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(
                authenticationRepository: _authenticationRepository),
          ),
          BlocProvider<UserBloc>(
            create: (context) => UserBloc()
              ..add(AuthenticationBlocUser(context.read<AuthenticationBloc>())),
          ),
          BlocProvider<CartBloc>(
            create: (context) =>
                CartBloc(cartRepository: CartRepository())..add(GetCart()),
          ),
        ],
        child: Provider(
          create: (context) => AppRouter(GoRouterRefreshStream(
              authenticationBloc: context.read<AuthenticationBloc>(),
              userBloc: context.read<UserBloc>())),
          child: Builder(builder: (context) {
            final routerConfig =
                Provider.of<AppRouter>(context, listen: false).router;

            return MaterialApp.router(
              title: 'HealthEat',
              theme: lightTheme(),
              routerConfig: routerConfig,
            );
          }),
        ),
      ),
    );
  }
}
