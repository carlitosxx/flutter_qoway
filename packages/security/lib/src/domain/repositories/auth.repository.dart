import 'package:security/src/core/either/either.dart';
import 'package:security/src/core/errors/http_request_failure.dart';

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
  GetRegisterFuture getRegister(String nombre, String email, String password);
}
