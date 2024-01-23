import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listener_test/login/bloc/login_bloc.dart';
import 'package:listener_test/login_sans_autoroute/view/login_page.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  group('LoginPage', () {
    testWidgets('renders correctly with two login buttons', (tester) async {
      final mockLoginBloc = MockLoginBloc();

      whenListen(
        mockLoginBloc,
        Stream.fromIterable([
          LoginInitial(),
        ]),
        initialState: LoginInitial(),
      );

      await tester.pumpWidget(
        BlocProvider<LoginBloc>(
          create: (context) => mockLoginBloc,
          lazy: false,
          child: const MaterialApp(
            home: LoginPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(LoginPage), findsOneWidget);
      expect(find.byType(ElevatedButton), findsNWidgets(2));
    });

    testWidgets('google button adds LoginGoogle event', (tester) async {
      final mockLoginBloc = MockLoginBloc();

      whenListen(
        mockLoginBloc,
        Stream.fromIterable([
          LoginInitial(),
        ]),
        initialState: LoginInitial(),
      );

      await tester.pumpWidget(
        BlocProvider<LoginBloc>(
          create: (context) => mockLoginBloc,
          lazy: false,
          child: const MaterialApp(
            home: LoginPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final loginGoogleButton =
          find.byKey(const ValueKey('login_google_button'));

      expect(loginGoogleButton, findsOneWidget);

      await tester.tap(loginGoogleButton);
      await tester.pumpAndSettle();

      verify(() => mockLoginBloc.add(LoginLoginGoogle()));
    });

    testWidgets('shows success snackbar when login is successful',
        (tester) async {
      final mockLoginBloc = MockLoginBloc();

      whenListen(
        mockLoginBloc,
        Stream.fromIterable([
          LoginInitial(),
          LoginLoggedIn(),
        ]),
        initialState: LoginInitial(),
      );

      when(() => mockLoginBloc.state).thenReturn(LoginLoggedIn());

      await tester.pumpWidget(
        BlocProvider<LoginBloc>(
          create: (context) => mockLoginBloc,
          lazy: false,
          child: const MaterialApp(
            home: LoginPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(BlocConsumer<LoginBloc, LoginState>), findsOneWidget);
      expect(
        find.byKey(const ValueKey('login_success_snackbar')),
        findsOneWidget,
      );
    });
  });
}
