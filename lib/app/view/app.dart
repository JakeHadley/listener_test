import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:listener_test/app/router.dart';
import 'package:listener_test/l10n/l10n.dart';
import 'package:listener_test/login/bloc/login_bloc.dart';
import 'package:listener_test/models/user.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (BuildContext context) {
            return LoginBloc()..add(LoginInfoChanged(User.empty()));
          },
        ),
      ],
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          AppRouter.goRouter.refresh();
        },
        child: MaterialApp.router(
          routerConfig: AppRouter.goRouter,
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            useMaterial3: true,
            brightness: Brightness.dark,
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
