import 'package:flutter/material.dart';
import 'package:qoway/ui/add_transaction/views/add_transaction_phone.view.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    /**
     * * (carlitosxx): Se necesita agregar la validacion de la plataforma y
     * * las vistas para telefono,tablet y escritorio 
    */

    return const AddTransactionPhoneView();
  }
}
