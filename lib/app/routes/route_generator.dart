import 'package:flutter/material.dart';
import 'package:qoway/ui/currency/currency.page.dart';
import 'package:qoway/ui/home/home_page.dart';
import 'package:qoway/ui/home/views/select_account_view.dart';
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
            ),
          );
        }
        return _errorRoute();
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case '/currency':
        return MaterialPageRoute(builder: (_) => const CurrencyPage());
      case '/selectAccount':
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SelectAccountView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0, 1);
            const end = Offset.zero;
            const curve = Curves.ease;
            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
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
