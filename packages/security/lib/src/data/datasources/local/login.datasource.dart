import 'package:database/database.dart';
import 'package:security/src/core/either/either.dart';
import 'package:security/src/core/errors/http_request_failure.dart';

/// interfaz Login
// ignore: one_member_abstracts
abstract class LoginDataSource {
  /// metodo sin implementar getLogin
  Future<Either<HttpRequestFailure, List<Map<String, dynamic>>>> getLogin(
    String email,
    String password,
  );
}

/// Imeplementacion del datasource
class LoginDataSourceImpl implements LoginDataSource {
  ///constructor
  LoginDataSourceImpl(this.sqlite);

  ///propiedad como packete database
  final Db sqlite;

  @override
  Future<Either<HttpRequestFailure, List<Map<String, dynamic>>>> getLogin(
    String email,
    String password,
  ) async {
    try {
      final response = await sqlite.obtenerUsuario(email, password);
      if (response.isNotEmpty) {
        return Either.right(response);
      }
      return Either.left(HttpRequestFailure.notFound());
    } catch (e) {
      return Either.left(HttpRequestFailure.local());
    }
  }
}
