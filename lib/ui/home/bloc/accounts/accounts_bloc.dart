import 'package:bloc/bloc.dart';
import 'package:currency/currency.dart';
import 'package:database/database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qoway/core/utils/map_failure_to_string.dart';

part 'accounts_event.dart';
part 'accounts_state.dart';
part 'accounts_bloc.freezed.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  AccountsBloc(
    this._accountsUC,
  ) : super(const _Initial()) {
    on<Loaded>(
      (event, emit) async {
        emit(const _Loading());
        final listAccounts = await _accountsUC(event.userId);
        listAccounts.when(
          left: (failure) =>
              emit(AccountsState.error(mapFailureToString(failure))),
          right: (accounts) => emit(AccountsState.loaded(accounts)),
        );
      },
    );
  }
  final AccountsUC _accountsUC;
}
