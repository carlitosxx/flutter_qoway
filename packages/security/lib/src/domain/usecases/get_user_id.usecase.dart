import 'package:security/src/domain/repositories/auth.repository.dart';

/// caso  de uso de obtener id del SecureStore
class GetUserIdUC {
  /// constructor
  GetUserIdUC(this.authRepository);

  /// propiedad
  final AuthRepository authRepository;

  /// llamada automatica
  Future<String> call(String keySecureStore) async {
    return authRepository.getUserIdOfSecureStore(keySecureStore);
  }
}
