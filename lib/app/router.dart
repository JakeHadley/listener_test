import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listener_test/app/router_utils.dart';
import 'package:listener_test/login/bloc/login_bloc.dart';
import 'package:listener_test/login/view/login_page.dart';
import 'package:listener_test/onboarding/view/onboarding_page.dart';
import 'package:listener_test/posts/view/posts_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

abstract class AppRouter {
  static final goRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Pages.posts.path,
    redirect: (context, state) {
      final loginState = context.read<LoginBloc>().state;
      if (loginState is LoginLoggedOut) {
        return Pages.login.path;
      }
      return null;
    },
    routes: [
      LoginPage.route,
      OnboardingPage.route,
      PostsPage.route,
    ],
  );
}
