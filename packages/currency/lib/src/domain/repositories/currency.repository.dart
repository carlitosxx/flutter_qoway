import 'package:core/core.dart';
import 'package:database/database.dart';

/// repositorio de currency
// ignore: one_member_abstracts
abstract class CurrencyRepository {
  /// interfaz getCurrencies para que sea implementado en la capa "data"
  Future<Either<HttpRequestFailure, List<Map<String, dynamic>>>>
      getCurrencies();

  /// interfaz para obtener la lista de cuentas y sus movimientos
  Future<Either<HttpRequestFailure, List<Cuentas>>> getAccounts(int userId);
}
