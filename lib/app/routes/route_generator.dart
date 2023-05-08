import 'package:flutter/material.dart';
import 'package:qoway/ui/currency/currency.page.dart';
import 'package:qoway/ui/home/home_page.dart';
import 'package:qoway/ui/login/login_page.dart';
import 'package:qoway/ui/register/register.page.dart';
import 'package:qoway/ui/splash/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/home':
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => HomePage(
                    userId: args,
                  ));
        }
        return _errorRoute();
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case '/currency':
        return MaterialPageRoute(builder: (_) => const CurrencyPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('Ups, ocurrio un error'),
          ),
        );
      },
    );
  }
}
