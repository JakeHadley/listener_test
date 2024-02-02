import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listener_test/app/router_utils.dart';
import 'package:listener_test/login/bloc/login_bloc.dart';
import 'package:listener_test/onboarding/bloc/onboarding_bloc.dart';
import 'package:listener_test/onboarding/view/onboarding_content.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  static final route = GoRoute(
    path: Pages.onboarding.path,
    builder: (context, state) => const OnboardingPage(),
  );

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool showNextButton = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, loginState) {
        if (loginState is LoginLoggedIn) {
          context.go(Pages.posts.path);
        }
      },
      builder: (context, loginState) {
        if (loginState is! LoginNewUser) {
          return const Center(
            child: Text('loading'),
          );
        }

        return BlocProvider<OnboardingBloc>(
          create: (context) {
            return OnboardingBloc()
              ..add(
                OnboardingStarted(
                  displayName: loginState.user.displayName,
                ),
              );
          },
          child: OnboardingContent(
            initialDisplayName: loginState.user.displayName,
          ),
        );
      },
    );
  }
}
