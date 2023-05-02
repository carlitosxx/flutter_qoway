import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'currency_set_event.dart';
part 'currency_set_state.dart';

class CurrencySetBloc extends Bloc<CurrencyEvent, CurrencySetState> {
  CurrencySetBloc() : super(const CurrencyInitialState()) {
    on<CurrencyLoadedEvent>((event, emit) {
      emit(CurrencySetLoadingState());
      emit(
        CurrencySetedState(
          id: event.id,
          descCurrency: event.descCurrency,
          descShortCurrency: event.descShortCurrency,
          simbolCurrency: event.simbolCurrency,
          sideCurrency: event.sideCurrency,
        ),
      );
    });
  }
}
