part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = RegisterStarted;
  const factory RegisterEvent.load(
    String name,
    String email,
    String password,
    String descCurrency,
    String descShortCurrency,
    String simbolCurrency,
    int sideCurrency,
  ) = RegisterLoad;
}

// class LoadRegisterEvent extends RegisterEvent {
//   const LoadRegisterEvent(
//     this.name,
//     this.email,
//     this.password,
//     this.descCurrency,
//     this.descShortCurrency,
//     this.simbolCurrency,
//     this.sideCurrency,
//   );
//   final String name;
//   final String email;
//   final String password;
//   final String descCurrency;
//   final String descShortCurrency;
//   final String simbolCurrency;
//   final int sideCurrency;
// }
