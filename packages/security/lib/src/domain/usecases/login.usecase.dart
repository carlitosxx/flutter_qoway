import 'package:security/src/domain/repositories/auth.repository.dart';

/// caso de uso de iniciar sesión
class LoginUC {
  ///constructor: inicia la interfaz o contrato de autenticación
  LoginUC(this.authRepository);

  /// propiedad: repositorio de Autenticación
  final AuthRepository authRepository;

  /// el nombre reservado "call" como nombre de un metodo o función en la clase,
  /// hace que cuando definamos nuestro caso de uso en la capa de presentacion
  /// especificamente en el BLOC, lo podamos llamar con el mismo nombre del
  /// caso de uso, por ejemplo:
  /// LoginUC _loginUC;
  /// await _loginUC(email, password)
  /// eso hara que se ejecute la funcion de abajo.
  LoginFuture call(String email, String password) async {
    return authRepository.getLogin(email, password);
  }
}
