import 'package:security/src/data/datasources/local/login.datasource.dart';
import 'package:security/src/data/datasources/local/register.datasource.dart';
import 'package:security/src/domain/repositories/auth.repository.dart';

/// implementacion del repositorio de autenticación
class AuthRepositoryImpl implements AuthRepository {
  /// constructor
  AuthRepositoryImpl(this._loginDataSource, this._registerDataSource);

  /// propiedad login
  final LoginDataSource _loginDataSource;

  /// propiedad register
  final RegisterDataSource _registerDataSource;

  @override
  LoginFuture getLogin(String email, String password) {
    return _loginDataSource.getLogin(email, password);
  }

  @override
  GetRegisterFuture getRegister(
    String name,
    String email,
    String password,
    String descCurrency,
    String descShortCurrency,
    String simbolCurrency,
    int sideCurrency,
  ) {
    return _registerDataSource.registerUser(
      name,
      email,
      password,
      descCurrency,
      descShortCurrency,
      simbolCurrency,
      sideCurrency,
    );
  }
}
