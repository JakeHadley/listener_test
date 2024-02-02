import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingInitial()) {
    on<OnboardingStarted>(_onOnboardingStarted);
    on<OnboardingChangedDisplayName>(_onOnboardingChangedDisplayName);
  }

  void _onOnboardingStarted(
    OnboardingStarted event,
    Emitter<OnboardingState> emit,
  ) {
    emit(OnboardingLoading());
    emit(OnboardingLoaded(displayName: event.displayName));
  }

  void _onOnboardingChangedDisplayName(
    OnboardingChangedDisplayName event,
    Emitter<OnboardingState> emit,
  ) {
    final prevState = state as OnboardingLoaded;
    emit(prevState.copyWith(displayName: event.displayName));
  }
}
