import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoway/app/app.dart';
import 'package:qoway/bootstrap.dart';
import 'package:qoway/injection_container.dart' as di;
import 'package:qoway/ui/currency/bloc/currency_bloc.dart';
import 'package:qoway/ui/home/bloc/accounts/accounts_bloc.dart';
import 'package:qoway/ui/login/bloc/login_bloc.dart';
import 'package:qoway/ui/register/bloc/currency/currency_set_bloc.dart';
import 'package:qoway/ui/register/bloc/register/register_bloc.dart';
import 'package:qoway/ui/splash/bloc/bloc/user_id_bloc.dart';

void main() {
  bootstrap(() async {
    await di.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<LoginBloc>()),
        BlocProvider(
          create: (_) => di.sl<CurrencyBloc>()..add(const LoadCurrencyEvent()),
        ),
        BlocProvider(create: (_) => di.sl<CurrencySetBloc>()),
        BlocProvider(create: (_) => di.sl<RegisterBloc>()),
        BlocProvider(
          create: (_) => di.sl<UserIdBloc>()..add(const UserIdLoad()),
        ),
        BlocProvider(
          create: (_) => di.sl<AccountsBloc>(),
        ),
      ],
      child: const App(),
    );
  });
}
