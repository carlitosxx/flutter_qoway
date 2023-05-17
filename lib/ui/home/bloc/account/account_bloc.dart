import 'package:bloc/bloc.dart';
import 'package:database/database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_event.dart';
part 'account_state.dart';
part 'account_bloc.freezed.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(const _Loading()) {
    on<Started>(
      (event, emit) {
        emit(AccountState.setAccount(event.cuentaInicial));
      },
    );
    on<Loaded>((event, emit) {
      emit(AccountState.setNewAccount(event.cuenta));
    });
    on<Reloaded>((event, emit) {
      emit(AccountState.reloadAccount(event.cuenta));
    });
  }
}
