part of 'account_bloc.dart';

@freezed
class AccountState with _$AccountState {
  const factory AccountState.initial() = _Initial;
  const factory AccountState.loading() = _Loading;
  const factory AccountState.setAccount(Cuentas cuenta) = _SetAccount;
  const factory AccountState.setNewAccount(Cuentas cuenta) = _SetNewAccount;
  // const factory AccountState.error(String error) = _Error;
}
