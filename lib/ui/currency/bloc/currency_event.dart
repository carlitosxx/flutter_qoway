part of 'currency_bloc.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();
}

class LoadCurrencyEvent extends CurrencyEvent {
  const LoadCurrencyEvent();
  @override
  List<Object?> get props => [];
}
