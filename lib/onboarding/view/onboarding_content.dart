import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:listener_test/login/bloc/login_bloc.dart';
import 'package:listener_test/onboarding/bloc/onboarding_bloc.dart';
import 'package:listener_test/onboarding/widgets/widgets.dart';

class OnboardingContent extends StatelessWidget {
  OnboardingContent({
    required this.initialDisplayName,
    GlobalKey<IntroductionScreenState>? introKey,
    super.key,
  }) : introKey = introKey ?? GlobalKey<IntroductionScreenState>();

  final String initialDisplayName;
  final GlobalKey<IntroductionScreenState> introKey;

  @override
  Widget build(BuildContext context) {
    void nextAction() {
      introKey.currentState?.next();
    }

    void backAction() {
      introKey.currentState?.previous();
    }

    void doneAction(Map<String, dynamic> onboardingStateMap) {
      context
          .read<LoginBloc>()
          .add(LoginOnboardingComplete(properties: onboardingStateMap));
    }

    void displayNameNextAction(String displayName) {
      context.read<OnboardingBloc>().add(
            OnboardingChangedDisplayName(displayName: displayName),
          );
      nextAction();
    }

    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, onboardingState) {
        if (onboardingState is OnboardingLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (onboardingState is OnboardingLoaded) {
          return IntroductionScreen(
            key: introKey,
            // freeze: true,
            curve: Curves.easeInOutBack,
            animationDuration: 900,
            pages: [
              getIntroPage(
                nextAction: nextAction,
              ),
              getNotificationsPage(
                nextAction: nextAction,
                backAction: backAction,
              ),
              getProfilePicturePage(
                nextAction: nextAction,
                backAction: backAction,
              ),
              getDisplayNamePage(
                nextAction: displayNameNextAction,
                backAction: backAction,
                initialDisplayName: initialDisplayName,
              ),
              getProfileInfoPage(
                nextAction: () => doneAction(onboardingState.toMap()),
                backAction: backAction,
              ),
            ],
            showDoneButton: false,
            showNextButton: false,
          );
        }
        return const SizedBox();
      },
    );
  }
}
