import 'package:core/core.dart';
import 'package:currency/src/domain/repositories/currency.repository.dart';

/// caso de uso de divisas
class CurrencyUC {
  /// construtctor
  CurrencyUC(this.currencyRepository);

  /// propiedad
  final CurrencyRepository currencyRepository;

  /// metodo para utilizar en el bloc con el mismo nombre del caso de uso
  Future<Either<HttpRequestFailure, List<Map<String, dynamic>>>> call() async {
    return currencyRepository.getCurrencies();
  }
}
