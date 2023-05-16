part of 'transaction_bloc.dart';

@freezed
class TransactionEvent with _$TransactionEvent {
  const factory TransactionEvent.started() = TransactionStarted;
  const factory TransactionEvent.clicked(
    Movimiento transaction,
    AccountBloc accountBloc,
  ) = TransactionClicked;
}
