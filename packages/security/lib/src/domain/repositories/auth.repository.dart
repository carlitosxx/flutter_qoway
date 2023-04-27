import 'package:security/src/core/either/either.dart';
import 'package:security/src/core/errors/http_request_failure.dart';
import 'package:security/src/domain/entities/usuario.entity.dart';

/// tipo de dato, puede retornar htttprequestFailure o Usuario
typedef GetLoginFuture = Future<Either<HttpRequestFailure, Usuario>>;

/// tipo de dato, puede retornar htttprequestFailure o Usuario
typedef GetRegisterFuture = Future<Either<HttpRequestFailure, Usuario>>;

/// Interfaz o Contrato para ser implementada en la capa de "data"
abstract class AuthRepository {
  /// interfaz getLogin para que sea implementado en la capa "data"
  GetLoginFuture getLogin(String email, String password);

  /// interfaz getRegister para que sea implementado en la capa "data"
  GetRegisterFuture getRegister(String nombre, String email, String password);
}
