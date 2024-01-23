import 'package:go_router/go_router.dart';
import 'package:listener_test/login/view/login_page.dart';

// GoRouter configuration
final goRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
  ],
);
