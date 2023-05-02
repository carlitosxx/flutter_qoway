import 'package:core/core.dart';

/// repositorio de currency
// ignore: one_member_abstracts
abstract class CurrencyRepository {
  /// interfaz getCurrencies para que sea implementado en la capa "data"
  Future<Either<HttpRequestFailure, List<Map<String, dynamic>>>>
      getCurrencies();
}
