import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qoway/ui/splash/bloc/bloc/user_id_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    const assetName = 'assets/logotipo.svg';
    return BlocConsumer<UserIdBloc, UserIdState>(
      listener: (context, state) {
        log('listener: $state');
        state.whenOrNull(
          error: () => Navigator.of(context).pushNamedAndRemoveUntil(
            '/login',
            (route) => false,
          ),
          loaded: (value) => {
            log('pase por aqui'),
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/home',
              (route) => false,
              arguments: value,
            ),
          },
        );
      },
      builder: (context, state) {
        log(state.toString());
        return state.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          // error: () {},
          initial: () => Scaffold(
            body: Center(child: SvgPicture.asset(assetName)),
          ),
          loading: () => Scaffold(
            body: Center(child: SvgPicture.asset(assetName)),
          ),
        );
      },
    );
  }
}
