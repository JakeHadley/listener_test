import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginLoginGoogle>(_onLoginLoginGoogle);
  }

  Future<void> _onLoginLoginGoogle(
    LoginLoginGoogle event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoggedIn());

    // emit(LoginError());
  }
}
