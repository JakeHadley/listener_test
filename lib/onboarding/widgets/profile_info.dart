import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:listener_test/onboarding/widgets/next_back_footer.dart';

PageViewModel getProfileInfoPage({
  required void Function() nextAction,
  required void Function() backAction,
}) {
  return PageViewModel(
    title: 'Profile Info',
    body: 'This is an onboarding page',
    image: const Center(
      child: FlutterLogo(size: 200),
    ),
    decoration: const PageDecoration(
      footerFlex: 0,
    ),
    footer: NextBackFooter(
      nextAction: nextAction,
      backAction: backAction,
      nextText: 'Done',
    ),
  );
}
