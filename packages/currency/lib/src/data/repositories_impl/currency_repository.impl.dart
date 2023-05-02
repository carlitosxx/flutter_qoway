import 'package:core/core.dart';
import 'package:currency/currency.dart';
// import 'package:currency/src/domain/repositories/currency.repository.dart';

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
}
