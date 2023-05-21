import 'package:core/core.dart';
import 'package:database/database.dart';

/// interfaz
// ignore: one_member_abstracts
abstract class GetUserByIdDataSource {
  /// metodo sin implementar de la interfvaz datasource
  Future<Either<HttpRequestFailure, List<Usuario>>> getUserById(String userId);
}

/// datasource implementacion
class GetUserByIdDataSourceImpl extends GetUserByIdDataSource {
  /// constructor
  GetUserByIdDataSourceImpl(this.sqlite);

  /// propiedad de la base de datos SQLite
  final Db sqlite;

  @override
  Future<Either<HttpRequestFailure, List<Usuario>>> getUserById(
    String userId,
  ) async {
    try {
      final response = await sqlite.getUserByUserId(userId);
      if (response.isNotEmpty) {
        return Either.right(response);
      }
      return Either.left(HttpRequestFailure.notFound());
    } catch (e) {
      // print(e);
      return Either.left(HttpRequestFailure.local());
    }
  }
}
