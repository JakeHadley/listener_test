import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:listener_test/onboarding/bloc/onboarding_bloc.dart';

void main() {
  group('OnboardingBloc', () {
    late OnboardingBloc onboardingBloc;

    setUp(() {
      onboardingBloc = OnboardingBloc();
    });

    tearDown(() {
      onboardingBloc.close();
    });

    blocTest<OnboardingBloc, OnboardingState>(
      'emits [OnboardingLoading, OnboardingLoaded] when OnboardingStarted is '
      'added',
      build: () => onboardingBloc,
      act: (bloc) =>
          bloc.add(const OnboardingStarted(displayName: 'Test User')),
      expect: () => <OnboardingState>[
        OnboardingLoading(),
        const OnboardingLoaded(displayName: 'Test User'),
      ],
    );

    blocTest<OnboardingBloc, OnboardingState>(
      'emits [OnboardingLoaded] with updated displayName when '
      'OnboardingChangedDisplayName is added',
      build: () => onboardingBloc,
      seed: () => const OnboardingLoaded(displayName: 'Old Name'),
      act: (bloc) =>
          bloc.add(const OnboardingChangedDisplayName(displayName: 'New Name')),
      expect: () => <OnboardingState>[
        const OnboardingLoaded(displayName: 'New Name'),
      ],
    );
  });
}
