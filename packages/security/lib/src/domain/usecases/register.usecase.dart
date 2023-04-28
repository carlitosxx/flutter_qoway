import 'package:security/src/domain/repositories/auth.repository.dart';

/// caso de uso de iniciar sesión
class RegisterUC {
  ///constructor: inicia la interfaz o contrato de autenticación
  RegisterUC(this.authRepository);

  /// propiedad: repositorio de Autenticación
  final AuthRepository authRepository;

  /// el nombre reservado "call" como nombre de un metodo o función en la clase,
  /// hace que cuando definamos nuestro caso de uso en la capa de presentacion
  /// especificamente en el BLOC, lo podamos llamar con el mismo nombre del
  /// caso de uso, por ejemplo:
  /// RegisterUC _registerUC;
  /// await _registerUC(name, email, password)
  /// eso hara que se ejecute la funcion de abajo.
  GetRegisterFuture call(String name, String email, String password) async {
    return authRepository.getRegister(
      name,
      email,
      password,
    );
  }
}
