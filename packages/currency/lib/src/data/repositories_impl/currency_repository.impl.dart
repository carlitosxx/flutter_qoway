import 'package:core/core.dart';
import 'package:currency/currency.dart';
import 'package:database/database.dart';

/// implementacion del repositorio de divisa
class CurrencyRepositoryImpl implements CurrencyRepository {
  /// constructor
  CurrencyRepositoryImpl(this._currencyDataSource);
  final CurrencyDataSource _currencyDataSource;

  @override
  Future<Either<HttpRequestFailure, List<Map<String, dynamic>>>>
      getCurrencies() {
    return _currencyDataSource.getCurrencies();
  }

  @override
  Future<Either<HttpRequestFailure, ResponseCuentas>> getAccounts(int userId) {
    return _currencyDataSource.getAccounts(userId);
  }

  @override
  Future<Either<HttpRequestFailure, int>> addTransaction(
    Movimiento transaction,
  ) {
    return _currencyDataSource.addTrasaction(transaction);
  }
}
