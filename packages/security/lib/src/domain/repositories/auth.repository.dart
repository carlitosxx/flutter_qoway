import 'package:core/core.dart';
import 'package:database/database.dart';

/// tipo de dato, puede retornar htttprequestFailure o Lista de map string
/// dynamic
typedef LoginFuture
    = Future<Either<HttpRequestFailure, List<Map<String, dynamic>>>>;

/// tipo de dato, puede retornar htttprequestFailure o Usuario
typedef GetRegisterFuture = Future<Either<HttpRequestFailure, int>>;

/// Interfaz o Contrato para ser implementada en la capa de "data"
abstract class AuthRepository {
  /// interfaz getLogin para que sea implementado en la capa "data"
  LoginFuture getLogin(String email, String password);

  /// interfaz getRegister para que sea implementado en la capa "data"
  GetRegisterFuture getRegister(
    String name,
    String email,
    String password,
    String descCurrency,
    String descShortCurrency,
    String simbolCurrency,
    int sideCurrency,
  );

  /// interfaz para obtener el userId del secure store
  Future<String> getUserIdOfSecureStore(String keySecureStore);

  /// interfaz para borrar un valor del secureStore
  Future<void> deleteValueFromSecureStore(String keySecureStore);

  /// interfaz para obtener el usuario segun id
  Future<Either<HttpRequestFailure, List<Usuario>>> getUserById(String id);
}
