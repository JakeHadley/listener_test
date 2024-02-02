import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listener_test/app/router_utils.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  static final route = GoRoute(
    path: Pages.posts.path,
    builder: (context, state) => const PostsPage(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Pages.posts.label),
      ),
      body: const Center(
        child: Text('Posts'),
      ),
    );
  }
}
