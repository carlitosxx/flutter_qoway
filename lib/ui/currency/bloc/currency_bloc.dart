import 'package:bloc/bloc.dart';
import 'package:currency/currency.dart';
import 'package:equatable/equatable.dart';
import 'package:qoway/core/utils/map_failure_to_string.dart';

part 'currency_event.dart';
part 'currency_state.dart';

class CurrencyBloc extends Bloc<CurrencyEvent, CurrencyState> {
  CurrencyBloc(this._currencyUC) : super(CurrencyInitial()) {
    on<LoadCurrencyEvent>((event, emit) async {
      emit(CurrencyLoadingState());
      final currencies = await _currencyUC();
      currencies.when(
        left: (failure) => emit(
          CurrencyErrorState(
            mapFailureToString(failure),
          ),
        ),
        right: (currencies) => emit(
          CurrencyLoadedState(currencies),
        ),
      );
    });
  }
  final CurrencyUC _currencyUC;
}
