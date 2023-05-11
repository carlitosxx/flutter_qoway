// ignore_for_file: one_member_abstracts

import 'package:core/core.dart';
import 'package:database/database.dart';

/// interfaz currency
abstract class CurrencyDataSource {
  /// metodo
  Future<Either<HttpRequestFailure, List<Map<String, dynamic>>>>
      getCurrencies();

  /// metodo
  Future<Either<HttpRequestFailure, ResponseCuentas>> getAccounts(int idUser);
}

/// implementacion del datasource
class CurrencyDataSourceImpl implements CurrencyDataSource {
  /// constructor
  CurrencyDataSourceImpl(this.sqlite);

  ///propiedad
  final Db sqlite;

  @override
  Future<Either<HttpRequestFailure, List<Map<String, dynamic>>>>
      getCurrencies() async {
    try {
      final response = await sqlite.getCurrencies();
      if (response.isNotEmpty) {
        return Either.right(response);
      }
      return Either.left(HttpRequestFailure.notFound());
    } catch (e) {
      return Either.left(HttpRequestFailure.local());
    }
  }

  @override
  Future<Either<HttpRequestFailure, ResponseCuentas>> getAccounts(
    int idUser,
  ) async {
    try {
      final response = await sqlite.getAccounts(idUser);
      if (response.data.isNotEmpty) {
        return Either.right(response);
      }
      return Either.left(HttpRequestFailure.notFound());
    } catch (e) {
      return Either.left(HttpRequestFailure.local());
    }
  }
}
