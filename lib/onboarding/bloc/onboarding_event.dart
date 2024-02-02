part of 'onboarding_bloc.dart';

sealed class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}

final class OnboardingChangedDisplayName extends OnboardingEvent {
  const OnboardingChangedDisplayName({
    required this.displayName,
  });

  final String displayName;

  @override
  List<Object> get props => [displayName];
}

final class OnboardingStarted extends OnboardingEvent {
  const OnboardingStarted({
    required this.displayName,
  });

  final String displayName;

  @override
  List<Object> get props => [displayName];
}
