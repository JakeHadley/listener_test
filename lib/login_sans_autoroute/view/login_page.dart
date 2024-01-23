import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listener_test/login/bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoggedIn) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                key: ValueKey('login_success_snackbar'),
                content: Text('success'),
                duration: Duration(seconds: 5),
              ),
            );
          }
          if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                key: ValueKey('login_error_snackbar'),
                content: Text('some error'),
                duration: Duration(seconds: 5),
              ),
            );
          }
        },
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
              Center(
                child: ElevatedButton(
                  key: const ValueKey('login_apple_button'),
                  onPressed: () {},
                  child: const Text('Sign in with Apple'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
