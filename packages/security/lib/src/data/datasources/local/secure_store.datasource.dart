import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Clase abstracta
abstract class SecureStoreDataSource {
  /// guardar en el secureStore
  void saveSecureStore(String keySecureStore, String value);

  /// obtener datos del secureStore
  Future<String> getSecureStore(String keySecureStore);

  /// eliminat datos del secureStore
  Future<void> deleteValueFromSecureStore(String keySecureStore);
}

/// implementacion del datasource
class SecureStoreDataSourceImpl implements SecureStoreDataSource {
  /// constructor
  SecureStoreDataSourceImpl(this.secureStorage);

  ///propiedad como secureStore
  final FlutterSecureStorage secureStorage;

  @override
  void saveSecureStore(String keySecureStore, String value) {
    secureStorage.write(key: keySecureStore, value: value);
  }

  @override
  Future<String> getSecureStore(String key) async {
    return await secureStorage.read(key: key) ?? '';
  }

  @override
  Future<void> deleteValueFromSecureStore(String keySecureStore) {
    return secureStorage.delete(key: keySecureStore);
  }
}
