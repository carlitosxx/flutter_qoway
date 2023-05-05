import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoway/l10n/l10n.dart';
import 'package:qoway/ui/common/widgets/button.dart';
import 'package:qoway/ui/login/bloc/login_bloc.dart';

class CustomButtoWidget extends StatelessWidget {
  const CustomButtoWidget({
    super.key,
    required this.text,
    required this.emailController,
    required this.passwordController,
  });
  final String text;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<LoginBloc, LoginState>(
      builder: (context, state) {
        //* initial state login
        if (state is LoginInitialState) {
          return ButtonWidget(
            onButtonClick: () async {
              if (emailController.text == '' || passwordController.text == '') {
                final snackBar = SnackBar(
                  content: Text(l10n.errorFieldsEmptySnackBar),
                  action: SnackBarAction(
                    label: l10n.labelCloseSnackBar,
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                context.read<LoginBloc>().add(
                      LoadLoginEvent(
                        emailController.text,
                        passwordController.text,
                      ),
                    );
              }
            },
            text: text,
          );
        }
        //* loading state login
        if (state is LoginLoadingState) {
          return ButtonWidget(
            onButtonClick: null,
            text: text,
          );
        }
        if (state is LoginLoadedState) {
          return ButtonWidget(
            onButtonClick: () async {
              if (emailController.text == '' || passwordController.text == '') {
                final snackBar = SnackBar(
                  content: Text(l10n.errorFieldsEmptySnackBar),
                  action: SnackBarAction(
                    label: l10n.labelCloseSnackBar,
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                context.read<LoginBloc>().add(
                      LoadLoginEvent(
                        emailController.text,
                        passwordController.text,
                      ),
                    );
              }
            },
            text: text,
          );
        }
        //* error state login
        if (state is LoginErrorState) {
          return ButtonWidget(
            onButtonClick: () async {
              if (emailController.text == '' || passwordController.text == '') {
                final snackBar = SnackBar(
                  content: Text(l10n.errorFieldsEmptySnackBar),
                  action: SnackBarAction(
                    label: l10n.labelCloseSnackBar,
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                context.read<LoginBloc>().add(
                      LoadLoginEvent(
                        emailController.text,
                        passwordController.text,
                      ),
                    );
              }
            },
            text: text,
          );
        }

        return const SizedBox.shrink();
      },
      listener: (context, state) {
        if (state is LoginLoadedState) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/home',
            (route) => false,
          );
        }
        if (state is LoginErrorState) {
          final snackBar = SnackBar(
            content: Text(l10n.errorNotFoundSnackBar),
            action: SnackBarAction(
              label: l10n.labelCloseSnackBar,
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
    );
  }
}
