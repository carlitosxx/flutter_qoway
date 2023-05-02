import 'package:core/core.dart';
import 'package:database/database.dart';

/// interfaz Login
// ignore: one_member_abstracts
abstract class RegisterDataSource {
  /// metodo sin implementar getLogin
  Future<Either<HttpRequestFailure, int>> registerUser(
    String name,
    String email,
    String password,
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
  ) async {
    try {
      final response = await sqlite.insertUsuario(name, email, password);
      if (response > 0) {
        return Either.right(response);
      }
      return Either.left(HttpRequestFailure.notFound());
    } catch (e) {
      return Either.left(HttpRequestFailure.local());
    }
  }
}
