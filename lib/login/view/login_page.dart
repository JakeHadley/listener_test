import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:listener_test/app/router_utils.dart';
import 'package:listener_test/login/bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static final route = GoRoute(
    path: Pages.login.path,
    builder: (context, state) => const LoginPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoggedIn) {
            context.go(Pages.posts.path);
          }
          if (state is LoginNewUser) {
            context.go(Pages.onboarding.path);
          }
          if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                key: const ValueKey('login_error_snackbar'),
                content: Text(state.message),
                duration: const Duration(seconds: 5),
              ),
            );
          }
        },
        // use this for button animation: https://blog.geekyants.com/flutter-login-animation-ab3e6ed4bd19
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  key: const ValueKey('login_google_button'),
                  onPressed: () {
                    context.read<LoginBloc>().add(LoginLoginGoogle());
                  },
                  child: const Text('Sign in with Google'),
                ),
              ),
              // Center(
              //   child: ElevatedButton(
              //     key: const ValueKey('login_apple_button'),
              //     onPressed: () {},
              //     child: const Text('Sign in with Apple'),
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
