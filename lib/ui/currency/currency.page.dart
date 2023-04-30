import 'package:flutter/material.dart';
import 'package:qoway/ui/currency/views/currency_phone.view.dart';

class CurrencyPage extends StatelessWidget {
  const CurrencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    /**
     * * (carlitosxx): Se necesita agregar la validacion de la plataforma y
     * * las vistas para telefono,tablet y escritorio 
    */
    return const CurrencyPhoneView();
  }
}
