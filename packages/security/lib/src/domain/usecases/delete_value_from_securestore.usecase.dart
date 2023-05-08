import 'package:security/src/domain/repositories/auth.repository.dart';

/// caso de uso salir sesion
class DeleteValueFromSecureStore {
  /// constructor
  DeleteValueFromSecureStore(this.authRepository);

  /// propiedad
  final AuthRepository authRepository;

  /// metodo call
  Future<void> call(String keySecureStore) {
    return authRepository.deleteValueFromSecureStore(keySecureStore);
  }
}
