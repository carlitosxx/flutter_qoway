import 'package:security/src/data/datasources/local/login.datasource.dart';
import 'package:security/src/data/datasources/local/register.datasource.dart';
import 'package:security/src/data/datasources/local/secure_store.datasource.dart';
import 'package:security/src/domain/repositories/auth.repository.dart';

/// implementacion del repositorio de autenticación
class AuthRepositoryImpl implements AuthRepository {
  /// constructor
  AuthRepositoryImpl(
    this._loginDataSource,
    this._registerDataSource,
    this._secureStoreDataSource,
  );

  /// propiedad DataSource login
  final LoginDataSource _loginDataSource;

  /// propiedad DataSource register
  final RegisterDataSource _registerDataSource;

  /// propiedad DataSource SecureStore
  final SecureStoreDataSource _secureStoreDataSource;

  @override
  LoginFuture getLogin(String email, String password) async {
    final responseFuture = _loginDataSource.getLogin(email, password);
    final response = await responseFuture;
    response.whenOrNull(
      right: (value) => _secureStoreDataSource.saveSecureStore(
        'cuenta',
        value[0]['id'].toString(),
      ),
    );
    return responseFuture;
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
  ) async {
    final responseFuture = _registerDataSource.registerUser(
      name,
      email,
      password,
      descCurrency,
      descShortCurrency,
      simbolCurrency,
      sideCurrency,
    );
    final response = await responseFuture;
    response.whenOrNull(
      right: (value) =>
          _secureStoreDataSource.saveSecureStore('cuenta', value.toString()),
    );
    return responseFuture;
  }

  @override
  Future<String> getUserIdOfSecureStore(String keySecureStore) async {
    final responseFuture =
        _secureStoreDataSource.getSecureStore(keySecureStore);
    final response = await responseFuture;
    if (response != '') {
      _secureStoreDataSource.saveSecureStore('cuenta', response);
    }
    return responseFuture;
  }

  @override
  Future<void> deleteValueFromSecureStore(String keySecureStore) {
    return _secureStoreDataSource.deleteValueFromSecureStore(keySecureStore);
  }
}
