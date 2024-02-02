import 'package:flutter/material.dart';

class NextBackFooter extends StatelessWidget {
  const NextBackFooter({
    required this.nextAction,
    required this.backAction,
    this.nextText,
    super.key,
  });

  final void Function() nextAction;
  final void Function() backAction;
  final String? nextText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              onPressed: backAction,
              child: const Text('Back'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              onPressed: nextAction,
              child: Text(nextText ?? 'Next'),
            ),
          ),
        ),
      ],
    );
  }
}
