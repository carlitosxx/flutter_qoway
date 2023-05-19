import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:security/src/domain/repositories/auth.repository.dart';

/// clase de caso de uso
class GetUserByIdUC {
  /// constructor
  GetUserByIdUC(this.authRepository);

  /// propiedad
  final AuthRepository authRepository;

  /// clase Callable que permite llamar a la clase de caso de uso
  Future<Either<HttpRequestFailure, List<Usuario>>> call(String userId) {
    return authRepository.getUserById(userId);
  }
}
