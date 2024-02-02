part of 'onboarding_bloc.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object> get props => [];
}

final class OnboardingInitial extends OnboardingState {}

final class OnboardingLoading extends OnboardingState {}

final class OnboardingLoaded extends OnboardingState {
  const OnboardingLoaded({
    required this.displayName,
  });

  final String displayName;

  @override
  List<Object> get props => [displayName];

  OnboardingLoaded copyWith({
    String? displayName,
  }) {
    return OnboardingLoaded(
      displayName: displayName ?? this.displayName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'displayName': displayName,
    };
  }
}
