import 'package:get_it/get_it.dart';
import 'package:security/security.dart';

class LogoutController {
  // LogoutController(this._deleteValueFromSecureStore);
  // final DeleteValueFromSecureStore _deleteValueFromSecureStore;
  Future<void> logout() async {
    final logoutUseCase = GetIt.I<DeleteValueFromSecureStore>();
    // final DeleteValueFromSecureStore _deleteValueFromSecureStore();
    await logoutUseCase('cuenta');
  }
}
