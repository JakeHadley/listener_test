part of 'login_bloc.dart';

@immutable
sealed class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInfoChanged extends LoginEvent {
  LoginInfoChanged(this.user);
  final User user;

  @override
  List<Object?> get props => [user];
}

class LoginLoginGoogle extends LoginEvent {}

class LoginLogOut extends LoginEvent {}

class LoginInitialized extends LoginEvent {}

class LoginOnboardingComplete extends LoginEvent {
  LoginOnboardingComplete({required this.properties});

  final Map<String, dynamic> properties;

  @override
  List<Object?> get props => [properties];
}
