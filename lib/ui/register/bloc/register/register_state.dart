part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.loaded(int id) = _Loaded;
  const factory RegisterState.error(String error) = _Error;
  // const RegisterState();

  // @override
  // List<Object> get props => [];
}

// class RegisterInitialState extends RegisterState {}

// class RegisterLoadingState extends RegisterState {}

// class RegisterLoadedState extends RegisterState {
//   const RegisterLoadedState(this.id);
//   final int id;
// }

// class RegisterErrorState extends RegisterState {
//   const RegisterErrorState(this.error);
//   final String error;
// }
