import 'package:bloc/bloc.dart';
import 'package:currency/currency.dart';
import 'package:database/database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qoway/core/utils/map_failure_to_string.dart';
import 'package:qoway/ui/home/bloc/account/account_bloc.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';
part 'transaction_bloc.freezed.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  TransactionBloc(this._transactionUC) : super(const _Initial()) {
    on<TransactionClicked>((event, emit) async {
      emit(const TransactionState.loading());
      final response = await _transactionUC(event.transaction);

      response.when(
        left: (failure) => emit(
          TransactionState.error(
            mapFailureToString(failure),
          ),
        ),
        right: (id) {
          final copyTransaction = event.transaction.copyWith(idMovimiento: id);
          final accountState = event.accountBloc.state;
          final account = accountState.whenOrNull(
            setNewAccount: (account) => account,
            // reloadAccount: (account) => account,
          );
          final accountCopy = account!.copyWith(
            total: account.total! + event.transaction.monto,
            movimientos: [copyTransaction, ...account.movimientos],
          );
          event.accountBloc.add(Loaded(accountCopy));
          return emit(TransactionState.success(id));
        },
      );
    });
  }
  final TransactionUC _transactionUC;
}
