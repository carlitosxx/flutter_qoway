import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    const assetName = 'assets/logotipo.svg';
    return Scaffold(
      body: Center(child: SvgPicture.asset(assetName)),
    );
  }
}
