part of 'accounts_bloc.dart';

@freezed
class AccountsEvent with _$AccountsEvent {
  const factory AccountsEvent.started() = Started;
  const factory AccountsEvent.load(int userId) = Loaded;
  const factory AccountsEvent.updated(ResponseCuentas listAccounts) = Updated;
}
