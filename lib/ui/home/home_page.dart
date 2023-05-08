import 'package:flutter/material.dart';
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
    return HomeViewPhone(
      userId: userId,
    );
  }
}
