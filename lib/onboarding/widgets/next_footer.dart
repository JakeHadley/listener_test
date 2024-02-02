import 'package:flutter/material.dart';

class NextFooter extends StatelessWidget {
  const NextFooter({
    required this.nextAction,
    super.key,
  });

  final void Function() nextAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ElevatedButton(
        onPressed: nextAction,
        child: const Text('Next'),
      ),
    );
  }
}
