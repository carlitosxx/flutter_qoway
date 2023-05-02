import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoway/app/app.dart';
import 'package:qoway/bootstrap.dart';
import 'package:qoway/injection_container.dart' as di;
import 'package:qoway/ui/currency/bloc/currency_bloc.dart';
import 'package:qoway/ui/login/bloc/login_bloc.dart';
import 'package:qoway/ui/register/bloc/currency/currency_set_bloc.dart';

void main() {
  bootstrap(() async {
    await di.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<LoginBloc>(),
        ),
        BlocProvider(
          create: (context) =>
              di.sl<CurrencyBloc>()..add(const LoadCurrencyEvent()),
        ),
        BlocProvider(create: (context) => di.sl<CurrencySetBloc>())
      ],
      child: const App(),
    );
  });
}
