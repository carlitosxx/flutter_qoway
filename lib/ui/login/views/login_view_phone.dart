import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qoway/l10n/l10n.dart';
import 'package:qoway/ui/login/bloc/login_bloc.dart';

class LoginViewPhone extends StatelessWidget {
  LoginViewPhone({super.key});
  final correo = TextEditingController();
  final clave = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const logo = 'assets/logotipo.svg';
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
                      const LogoWidget(logo: logo),

                      /// titulo de bienvenida
                      TextWelcomeWidget(l10n: l10n),

                      /// campo correo
                      FieldWidget(
                        controller: correo,
                        hint: l10n.hintEmailLogin,
                        inputType: TextInputType.emailAddress,
                        isPassword: false,
                      ),

                      /// campo clave
                      FieldWidget(
                        controller: clave,
                        hint: l10n.hintPasswordLogin,
                        inputType: TextInputType.visiblePassword,
                        isPassword: true,
                      ),

                      /// boton de ingresar
                      Container(
                        padding: const EdgeInsets.fromLTRB(30, 7, 30, 0),
                        width: double.infinity,
                        child: ButtomWidget(
                          text: l10n.textButtomLogin,
                          emailController: correo,
                          passwordController: clave,
                        ),
                      ),

                      /// texto y link para registrar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(l10n.textNoAccount),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/signup');
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

class ButtomWidget extends StatelessWidget {
  const ButtomWidget({
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
          return ElevatedButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              elevation: 0,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () async {
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
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          );
        }
        //* loading state login
        if (state is LoginLoadingState) {
          return ElevatedButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              elevation: 0,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: null,
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          );
        }
        //! error state login
        if (state is LoginErrorState) {
          return ElevatedButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              elevation: 0,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () async {
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
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          );
        }
        print(state);
        return const Text('');
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

class FieldWidget extends StatefulWidget {
  const FieldWidget({
    super.key,
    required this.controller,
    required this.inputType,
    required this.hint,
    required this.isPassword,
  });

  final TextEditingController controller;
  final String hint;
  final TextInputType inputType;
  final bool isPassword;

  @override
  State<FieldWidget> createState() => _FieldWidgetState();
}

class _FieldWidgetState extends State<FieldWidget> {
  bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 0, 30, 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.onBackground.withOpacity(.2),
      ),
      child: Stack(
        children: [
          Visibility(
            visible: widget.isPassword,
            child: Positioned(
              right: 15,
              top: 12,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isOpen = !isOpen;
                    });
                  },
                  child:
                      Icon(isOpen ? Icons.visibility : Icons.visibility_off)),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              controller: widget.controller,
              obscureText: !isOpen,
              maxLength: 50,
              keyboardType: widget.inputType,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                counterText: '',
                border: InputBorder.none,
                hintText: widget.hint,
                hintStyle: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextWelcomeWidget extends StatelessWidget {
  const TextWelcomeWidget({
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

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
    required this.logo,
  });

  final String logo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: const Size.fromHeight(kToolbarHeight).height,
      ),
      child: Center(
        child: SvgPicture.asset(
          logo,
          height: 150,
        ),
      ),
    );
  }
}
