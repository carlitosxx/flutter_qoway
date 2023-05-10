import 'package:core/core.dart';
import 'package:currency/currency.dart';
// ignore: implementation_imports
import 'package:database/src/models/cuentas.model.dart';

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
  Future<Either<HttpRequestFailure, List<Cuentas>>> getAccounts(int userId) {
    return _currencyDataSource.getAccounts(userId);
  }
}
