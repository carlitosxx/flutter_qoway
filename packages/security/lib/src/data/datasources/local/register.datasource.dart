import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:sqflite/sqflite.dart';

/// interfaz Login
// ignore: one_member_abstracts
abstract class RegisterDataSource {
  /// metodo sin implementar getLogin
  Future<Either<HttpRequestFailure, int>> registerUser(
    String name,
    String email,
    String password,
    String descCurrency,
    String descShortCurrency,
    String simbolCurrency,
    int sideCurrency,
  );
}

/// Imeplementacion del datasource
class RegisterDataSourceImpl implements RegisterDataSource {
  ///constructor
  RegisterDataSourceImpl(this.sqlite);

  ///propiedad como packete database
  final Db sqlite;

  @override
  Future<Either<HttpRequestFailure, int>> registerUser(
    String name,
    String email,
    String password,
    String descCurrency,
    String descShortCurrency,
    String simbolCurrency,
    int sideCurrency,
  ) async {
    try {
      final response = await sqlite.insertUser(
        name,
        email,
        password,
        descCurrency,
        descShortCurrency,
        simbolCurrency,
        sideCurrency,
      );
      if (response > 0) {
        return Either.right(response);
      } else if (response == -1) {
        return Either.left(HttpRequestFailure.alreadyExist());
      }
      return Either.left(HttpRequestFailure.local());
    } on DatabaseException catch (e) {
      if (e.isUniqueConstraintError()) {
        return Either.left(HttpRequestFailure.alreadyExist());
      } else {
        return Either.left(HttpRequestFailure.local());
      }
    } catch (e) {
      return Either.left(HttpRequestFailure.local());
    }
  }
}
