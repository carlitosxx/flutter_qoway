import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    const logo = 'assets/logotipo.svg';
    return Center(
      child: SvgPicture.asset(
        logo,
        height: height,
      ),
    );
  }
}
