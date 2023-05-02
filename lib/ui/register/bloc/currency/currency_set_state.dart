part of 'currency_set_bloc.dart';

abstract class CurrencySetState extends Equatable {
  const CurrencySetState();
}

class CurrencySetLoadingState extends CurrencySetState {
  @override
  List<Object?> get props => [];
}

class CurrencyInitialState extends CurrencySetState {
  const CurrencyInitialState({
    this.id = 0,
    this.descCurrency = '',
    this.descShortCurrency = '',
    this.simbolCurrency = '',
    this.sideCurrency = 0,
  });
  final int id;
  final String descCurrency;
  final String descShortCurrency;
  final String simbolCurrency;
  final int sideCurrency;

  @override
  List<Object?> get props =>
      [id, descCurrency, descShortCurrency, simbolCurrency, sideCurrency];
}

class CurrencySetedState extends CurrencySetState {
  const CurrencySetedState({
    required this.id,
    required this.descCurrency,
    required this.descShortCurrency,
    required this.simbolCurrency,
    required this.sideCurrency,
  });
  final int id;
  final String descCurrency;
  final String descShortCurrency;
  final String simbolCurrency;
  final int sideCurrency;

  CurrencySetState copyWith({
    int? id,
    String? descCurrency,
    String? descShortCurrency,
    String? simbolCurrency,
    int? sideCurrency,
  }) =>
      CurrencySetedState(
        id: id ?? this.id,
        descCurrency: descCurrency ?? this.descCurrency,
        descShortCurrency: descCurrency ?? this.descCurrency,
        simbolCurrency: descCurrency ?? this.descCurrency,
        sideCurrency: sideCurrency ?? this.sideCurrency,
      );
  @override
  List<Object?> get props =>
      [id, descCurrency, descShortCurrency, simbolCurrency, sideCurrency];
}
