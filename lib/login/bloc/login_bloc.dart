import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:listener_test/models/user.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginInfoChanged>(_onLoginInfoChanged);
    on<LoginLoginGoogle>(_onLoginLoginGoogle);
    on<LoginLogOut>(_onLoginLogOut);
    on<LoginOnboardingComplete>(_onLoginOnboardingComplete);
  }

  Future<void> _onLoginInfoChanged(
    LoginInfoChanged event,
    Emitter<LoginState> emit,
  ) async {
    if (event.user.isEmpty()) {
      emit(LoginLoggedOut());
    } else {
      final userExists = false;

      emit(userExists ? LoginLoggedIn(event.user) : LoginNewUser(event.user));
    }
  }

  Future<void> _onLoginLoginGoogle(
    LoginLoginGoogle event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      add(LoginInfoChanged(User(uid: '123', displayName: 'abc')));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  Future<void> _onLoginLogOut(
    LoginLogOut event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      add(LoginInfoChanged(User.empty()));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  Future<void> _onLoginOnboardingComplete(
    LoginOnboardingComplete event,
    Emitter<LoginState> emit,
  ) async {
    final prevState = state as LoginNewUser;

    emit(LoginLoggedIn(prevState.user));
  }
}
