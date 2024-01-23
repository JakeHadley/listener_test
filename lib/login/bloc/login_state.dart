part of 'login_bloc.dart';

@immutable
sealed class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoggedOut extends LoginState {}

class LoginLoggedIn extends LoginState {}

class LoginError extends LoginState {}
