part of 'currency_set_bloc.dart';

abstract class CurrencyEvent extends Equatable {
  const CurrencyEvent();

  @override
  List<Object> get props => [];
}

class CurrencyLoadedEvent extends CurrencyEvent {
  const CurrencyLoadedEvent(
    this.id,
    this.descCurrency,
    this.descShortCurrency,
    this.simbolCurrency,
    this.sideCurrency,
  );
  final int id;
  final String descCurrency;
  final String descShortCurrency;
  final String simbolCurrency;
  final int sideCurrency;
}
