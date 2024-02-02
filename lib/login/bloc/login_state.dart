part of 'login_bloc.dart';

@immutable
sealed class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoggedOut extends LoginState {}

class LoginLoggedIn extends LoginState {
  LoginLoggedIn(this.user);
  final User user;

  @override
  List<Object?> get props => [user];
}

class LoginNewUser extends LoginState {
  LoginNewUser(this.user);
  final User user;

  @override
  List<Object?> get props => [user];
}

class LoginError extends LoginState {
  LoginError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
