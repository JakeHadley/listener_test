import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listener_test/login/bloc/login_bloc.dart';
import 'package:listener_test/login/view/login_page.dart';
import 'package:listener_test/models/user.dart';
import 'package:listener_test/onboarding/view/onboarding_page.dart';
import 'package:listener_test/posts/view/posts_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  group('LoginPage', () {
    late LoginBloc loginBloc;

    setUp(() {
      loginBloc = MockLoginBloc();
    });

    testWidgets('renders correctly with two login buttons', (tester) async {
      whenListen(
        loginBloc,
        Stream.fromIterable([
          LoginLoggedOut(),
        ]),
        initialState: LoginLoggedOut(),
      );
      await tester.pumpAppWithRoutes<LoginBloc>(loginBloc);
      await tester.pumpAndSettle();

      expect(find.byType(LoginPage), findsOneWidget);
      expect(find.byType(ElevatedButton), findsNWidgets(1));
    });

    testWidgets('google button adds LoginGoogle event', (tester) async {
      whenListen(
        loginBloc,
        Stream.fromIterable([
          LoginLoggedOut(),
        ]),
        initialState: LoginLoggedOut(),
      );

      await tester.pumpAppWithRoutes<LoginBloc>(loginBloc);
      await tester.pumpAndSettle();

      final loginGoogleButton =
          find.byKey(const ValueKey('login_google_button'));

      expect(loginGoogleButton, findsOneWidget);

      await tester.tap(loginGoogleButton);
      await tester.pumpAndSettle();

      verify(() => loginBloc.add(LoginLoginGoogle()));
    });

    testWidgets('navigates to PostsPage when login is successful',
        (tester) async {
      final dummyUser = User(uid: 'id', displayName: 'name');

      whenListen(
        loginBloc,
        Stream.fromIterable([
          LoginLoggedOut(),
          LoginLoggedIn(dummyUser),
        ]),
        initialState: LoginLoggedOut(),
      );

      await tester.pumpAppWithRoutes<LoginBloc>(loginBloc);
      await tester.pumpAndSettle();

      expect(find.byType(PostsPage), findsOneWidget);
    });

    testWidgets('shows snackbar when login fails', (tester) async {
      whenListen(
        loginBloc,
        Stream.fromIterable([
          LoginLoggedOut(),
          LoginError('error'),
        ]),
        initialState: LoginLoggedOut(),
      );

      await tester.pumpAppWithRoutes<LoginBloc>(loginBloc);
      await tester.pumpAndSettle();

      final loginGoogleButton =
          find.byKey(const ValueKey('login_google_button'));

      expect(find.byType(LoginPage), findsOneWidget);
      expect(loginGoogleButton, findsOneWidget);

      expect(
        find.byKey(const ValueKey('login_error_snackbar')),
        findsOneWidget,
      );
    });

    testWidgets(
        'navigates to Onboarding when login is successful and the user is new',
        (tester) async {
      final dummyUser = User(uid: 'id', displayName: 'name');

      whenListen(
        loginBloc,
        Stream.fromIterable([
          LoginLoggedOut(),
          LoginNewUser(dummyUser),
        ]),
        initialState: LoginLoggedOut(),
      );

      await tester.pumpAppWithRoutes<LoginBloc>(loginBloc);
      await tester.pumpAndSettle();

      expect(find.byType(OnboardingPage), findsOneWidget);
    });
  });
}
