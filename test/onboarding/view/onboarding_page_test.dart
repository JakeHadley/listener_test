import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listener_test/login/bloc/login_bloc.dart';
import 'package:listener_test/models/user.dart';
import 'package:listener_test/onboarding/bloc/onboarding_bloc.dart';
import 'package:listener_test/onboarding/view/onboarding_content.dart';
import 'package:listener_test/posts/view/posts_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  group('OnboardingPage', () {
    late LoginBloc loginBloc;

    setUp(() {
      loginBloc = MockLoginBloc();
    });

    testWidgets('shows loading text when not LoginNewUser',
        (WidgetTester tester) async {
      final dummyUser = User(uid: 'id', displayName: 'name');

      whenListen(
        loginBloc,
        Stream.fromIterable([
          LoginLoggedOut(),
          LoginNewUser(dummyUser),
          LoginLoading(),
        ]),
        initialState: LoginLoggedOut(),
      );

      await tester.pumpAppWithRoutes<LoginBloc>(loginBloc);
      await tester.pumpAndSettle();

      expect(find.text('loading'), findsOneWidget);
    });

    testWidgets('shows OnboardingBloc when LoginNewUser',
        (WidgetTester tester) async {
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

      expect(find.byType(BlocProvider<OnboardingBloc>), findsOneWidget);
      expect(find.byType(OnboardingContent), findsOneWidget);
    });

    testWidgets('navigates to PostPage when onboarding is complete',
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

      expect(find.byType(OnboardingContent), findsOneWidget);

      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();

      expect(find.text('Profile Info'), findsOneWidget);
      expect(find.text('Done'), findsOneWidget);

      await tester.tap(find.text('Done'));
      await tester.pumpAndSettle();

      verify(
        () => loginBloc.add(
          LoginOnboardingComplete(properties: const {'displayName': 'name'}),
        ),
      );

      whenListen(
        loginBloc,
        Stream.fromIterable([
          LoginLoggedIn(dummyUser),
        ]),
      );

      await expectLater(
        loginBloc.stream,
        emitsInOrder([
          LoginLoggedIn(dummyUser),
        ]),
      );
      await tester.pumpAndSettle();
      expect(find.byType(PostsPage), findsOneWidget);
    });
  });
}
