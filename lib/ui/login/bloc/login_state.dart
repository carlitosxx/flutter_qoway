part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoadedState extends LoginState {
  LoginLoadedState(this.usuario);
  final List<Map<String, dynamic>> usuario;

  @override
  List<Object?> get props => [usuario];
}

class LoginErrorState extends LoginState {
  LoginErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
