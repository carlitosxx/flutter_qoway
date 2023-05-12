part of 'account_bloc.dart';

@freezed
class AccountEvent with _$AccountEvent {
  const factory AccountEvent.started(Cuentas cuentaInicial) = Started;
  const factory AccountEvent.loaded(Cuentas cuenta) = Loaded;
}
