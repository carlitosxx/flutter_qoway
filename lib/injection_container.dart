// ignore_for_file: cascade_invocations

import 'package:currency/currency.dart';
import 'package:database/database.dart';
import 'package:get_it/get_it.dart';
import 'package:qoway/ui/currency/bloc/currency_bloc.dart';
import 'package:qoway/ui/login/bloc/login_bloc.dart';
import 'package:qoway/ui/register/bloc/currency/currency_set_bloc.dart';
import 'package:security/security.dart';

final sl = GetIt.instance;
Future<void> init() async {
  /// BLOC's
  sl.registerFactory(() => LoginBloc(sl()));
  // ..registerFactory(() => LoginBloc(sl()))
  sl.registerFactory(() => CurrencyBloc(sl()));
  sl.registerFactory(CurrencySetBloc.new);

  /// Casos de Uso
  sl.registerLazySingleton(() => LoginUC(sl()));
  sl.registerLazySingleton(() => CurrencyUC(sl()));

  /// Repositorios
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(), sl()),
  );
  sl.registerLazySingleton<CurrencyRepository>(
    () => CurrencyRepositoryImpl(sl()),
  );

  /// Data source
  sl.registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl(sl()));
  sl.registerLazySingleton<RegisterDataSource>(
    () => RegisterDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<CurrencyDataSource>(
    () => CurrencyDataSourceImpl(
      sl(),
    ),
  );

  /// Librerias
  sl.registerLazySingleton(Db.new);
}
