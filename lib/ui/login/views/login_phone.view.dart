import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoway/l10n/l10n.dart';
import 'package:qoway/ui/common/widgets/button.dart';
import 'package:qoway/ui/common/widgets/field.dart';
import 'package:qoway/ui/common/widgets/logo.dart';
import 'package:qoway/ui/login/bloc/login_bloc.dart';

class LoginPhoneView extends StatelessWidget {
  LoginPhoneView({super.key});
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: Scaffold(
            body: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      // logotipo
                      Container(
                        padding: EdgeInsets.only(
                          top: const Size.fromHeight(kToolbarHeight).height,
                        ),
                        child: const LogoWidget(height: 150),
                      ),

                      /// titulo de Inicio de sesión
                      TitleLoginWidget(l10n: l10n),

                      /// campo correo
                      FieldWidget(
                        controller: email,
                        hint: l10n.hintEmailLogin,
                        inputType: TextInputType.emailAddress,
                        isPassword: false,
                      ),

                      /// campo clave
                      FieldWidget(
                        controller: password,
                        hint: l10n.hintPasswordLogin,
                        inputType: TextInputType.visiblePassword,
                        isPassword: true,
                      ),

                      /// boton de ingresar
                      Container(
                        padding: const EdgeInsets.fromLTRB(30, 7, 30, 0),
                        width: double.infinity,
                        child: CustomButtoWidget(
                          text: l10n.textButtomLogin,
                          emailController: email,
                          passwordController: password,
                        ),
                      ),

                      /// texto y link para registrar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(l10n.textNoAccount),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/register');
                            },
                            child: Text(l10n.textSignUp),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
          Navigator.of(context).pushReplacementNamed('/home');
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

class TitleLoginWidget extends StatelessWidget {
  const TitleLoginWidget({
    super.key,
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Text(
        l10n.titleLogin,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
