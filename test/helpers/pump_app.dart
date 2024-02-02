import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listener_test/app/router.dart';
import 'package:listener_test/l10n/l10n.dart';

extension PumpAppWithRoutes on WidgetTester {
  Future<void> pumpAppWithRoutes<T extends Bloc<dynamic, dynamic>>(T mockBloc) {
    return pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider<T>(
            lazy: false,
            create: (context) => mockBloc,
          ),
        ],
        child: MaterialApp.router(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: AppRouter.goRouter,
        ),
      ),
    );
  }
}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) {
    return pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: widget,
      ),
    );
  }
}
