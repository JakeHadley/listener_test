import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:listener_test/onboarding/widgets/next_footer.dart';

PageViewModel getIntroPage({required void Function() nextAction}) {
  return PageViewModel(
    title: 'Welcome to UNF Baseball!',
    body: 'This is an onboarding page',
    image: const Center(
      child: FlutterLogo(size: 200),
    ),
    decoration: const PageDecoration(
      footerFlex: 0,
    ),
    footer: NextFooter(
      nextAction: nextAction,
    ),
  );
}
