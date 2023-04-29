import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:qoway/core/utils/map_failure_to_string.dart';
import 'package:security/security.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._loginUC) : super(LoginInitialState()) {
    on<LoadLoginEvent>((event, emit) async {
      emit(LoginLoadingState());
      final login = await _loginUC(event.email, event.password);
      login.when(
        left: (failure) => emit(LoginErrorState(mapFailureToString(failure))),
        right: (login) => emit(LoginLoadedState(login)),
      );
    });
  }
  final LoginUC _loginUC;
}
