part of 'currency_bloc.dart';

abstract class CurrencyState extends Equatable {}

class CurrencyInitial extends CurrencyState {
  @override
  List<Object?> get props => [];
}

class CurrencyLoadingState extends CurrencyState {
  CurrencyLoadingState();
  @override
  List<Object?> get props => [];
}

class CurrencyLoadedState extends CurrencyState {
  CurrencyLoadedState(this.currencies);
  final List<Map<String, dynamic>> currencies;

  @override
  List<Object?> get props => [currencies];
}

class CurrencyErrorState extends CurrencyState {
  CurrencyErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
