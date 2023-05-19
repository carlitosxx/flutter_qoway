import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:qoway/ui/home/bloc/account/account_bloc.dart' as acc;
import 'package:qoway/ui/home/bloc/accounts/accounts_bloc.dart';
import 'package:qoway/ui/home/views/home_view_phone.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.userId});
  final String userId;
  @override
  Widget build(BuildContext context) {
    /**
     * * (carlitosxx): Se necesita agregar la validacion de la plataforma y
     * * las vistas para telefono,tablet y escritorio 
    */
    context.read<AccountsBloc>().add(Loaded(int.parse(userId)));

    return HomeViewPhone(
      userId: userId,
    );
  }
}
