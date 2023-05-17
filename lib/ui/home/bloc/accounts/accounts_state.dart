part of 'accounts_bloc.dart';

@freezed
class AccountsState with _$AccountsState {
  const factory AccountsState.initial() = _Initial;
  const factory AccountsState.loading() = _Loading;
  const factory AccountsState.loaded(ResponseCuentas listAccounts) = _Loaded;
  const factory AccountsState.newListAccounts(ResponseCuentas listAccounts) =
      _NewListAccounts;
  const factory AccountsState.error(String error) = _Error;
}
