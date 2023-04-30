import 'package:flutter/material.dart';
import 'package:qoway/ui/login/views/login_phone.view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    /**
     * * (carlitosxx): Se necesita agregar la validacion de la plataforma y
     * * las vistas para telefono,tablet y escritorio 
    */
    return LoginPhoneView();
  }
}
