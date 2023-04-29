import 'package:database/database.dart';
import 'package:get_it/get_it.dart';
import 'package:qoway/ui/login/bloc/login_bloc.dart';
import 'package:security/security.dart';

final sl = GetIt.instance;
Future<void> init() async {
  /// BLOC's
  sl
    ..registerFactory(() => LoginBloc(sl()))

    /// Casos de Uso
    ..registerLazySingleton(() => LoginUC(sl()))

    /// Repositorios
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl()),
    )

    /// Data source
    ..registerLazySingleton<LoginDataSource>(() => LoginDataSourceImpl(sl()))
    ..registerLazySingleton<RegisterDataSource>(
      () => RegisterDataSourceImpl(sl()),
    )

    /// Librerias
    ..registerLazySingleton(Db.new);
}
