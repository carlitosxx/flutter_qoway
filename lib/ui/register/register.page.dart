import 'package:flutter/material.dart';
import 'package:qoway/ui/register/views/register_phone.view.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    /**
     * * (carlitosxx): Se necesita agregar la validacion de la plataforma y
     * * las vistas para telefono,tablet y escritorio 
    */
    return RegisterPhoneView();
  }
}
