// ignore_for_file: cascade_invocations

import 'package:currency/currency.dart';
import 'package:database/database.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:qoway/ui/currency/bloc/currency_bloc.dart';
import 'package:qoway/ui/home/bloc/accounts/accounts_bloc.dart';
import 'package:qoway/ui/login/bloc/login_bloc.dart';
import 'package:qoway/ui/register/bloc/currency/currency_set_bloc.dart';
import 'package:qoway/ui/register/bloc/register/register_bloc.dart';
import 'package:qoway/ui/splash/bloc/bloc/user_id_bloc.dart';
import 'package:security/security.dart';

final sl = GetIt.instance;
Future<void> init() async {
  /// BLOC's
  sl.registerFactory(() => LoginBloc(sl()));
  sl.registerFactory(() => RegisterBloc(sl()));
  sl.registerFactory(() => CurrencyBloc(sl()));
  sl.registerFactory(CurrencySetBloc.new);
  sl.registerFactory(() => UserIdBloc(sl()));
  sl.registerFactory(() => AccountsBloc(sl()));

  /// Casos de Uso
  sl.registerLazySingleton(() => LoginUC(sl()));
  sl.registerLazySingleton(() => CurrencyUC(sl()));
  sl.registerLazySingleton(() => RegisterUC(sl()));
  sl.registerLazySingleton(() => GetUserIdUC(sl()));
  sl.registerLazySingleton(() => DeleteValueFromSecureStore(sl()));
  sl.registerLazySingleton(() => AccountsUC(sl()));

  /// Repositorios
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl(), sl()),
  );
  sl.registerLazySingleton<CurrencyRepository>(
    () => CurrencyRepositoryImpl(sl()),
  );

  /// Data source
  sl.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl(sl()));
  sl.registerLazySingleton<RegisterDataSource>(
    () => RegisterDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<SecureStoreDataSource>(
    () => SecureStoreDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<CurrencyDataSource>(
    () => CurrencyDataSourceImpl(
      sl(),
    ),
  );

  /// Librerias externas
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(Db.new);
}
