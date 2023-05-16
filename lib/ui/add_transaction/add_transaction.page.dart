import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoway/injection_container.dart' as di;
import 'package:qoway/ui/add_transaction/bloc/transaction/transaction_bloc.dart';
import 'package:qoway/ui/add_transaction/views/add_transaction_phone.view.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({super.key, required this.accountId});
  final String accountId;
  @override
  Widget build(BuildContext context) {
    /**
     * * (carlitosxx): Se necesita agregar la validacion de la plataforma y
     * * las vistas para telefono,tablet y escritorio 
    */
    return BlocProvider(
      create: (_) => di.sl<TransactionBloc>(),
      child: AddTransactionPhoneView(accountId: accountId),
    );
    // return const AddTransactionPhoneView();
  }
}
