import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoway/l10n/l10n.dart';
import 'package:qoway/ui/common/widgets/button.dart';
import 'package:qoway/ui/common/widgets/field.dart';
import 'package:qoway/ui/common/widgets/logo.dart';
import 'package:qoway/ui/register/bloc/currency/currency_set_bloc.dart';
import 'package:qoway/ui/register/bloc/register/register_bloc.dart';

class RegisterPhoneView extends StatelessWidget {
  RegisterPhoneView({super.key});
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final repassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var controllerCurrency = <String, dynamic>{
      'id': 0,
      'descCurrency': '',
      'descShortCurrency': '',
      'simbolCurrency': '',
      'sideCurrency': 1
    };
    final l10n = context.l10n;
    return GestureDetector(
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
                    /// Logo
                    Container(
                      padding: EdgeInsets.only(
                        top: const Size.fromHeight(kToolbarHeight).height,
                      ),
                      child: const LogoWidget(height: 100),
                    ),

                    /// Titulo
                    TitleRegisterWidget(l10n: l10n),

                    /// campo nombre
                    FieldWidget(
                      controller: name,
                      hint: l10n.hintNameLogin,
                      inputType: TextInputType.emailAddress,
                      isPassword: false,
                    ),

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

                    /// campo reclave
                    FieldWidget(
                      controller: repassword,
                      hint: l10n.hintRePasswordLogin,
                      inputType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),

                    /// campo moneda
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/currency');
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(30, 0, 30, 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(.2),
                        ),
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Center(
                            child:
                                BlocBuilder<CurrencySetBloc, CurrencySetState>(
                              builder: (context, state) {
                                if (state is CurrencySetedState) {
                                  return Text(
                                    state.descCurrency,
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                  );
                                }
                                return Text(
                                  l10n.hintCurrencyRegister,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground
                                        .withOpacity(0.3),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// boton registrar
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 7, 30, 0),
                      width: double.infinity,
                      child: BlocBuilder<CurrencySetBloc, CurrencySetState>(
                        builder: (context, state) {
                          if (state is CurrencySetedState) {
                            controllerCurrency = {
                              'id': state.id,
                              'descCurrency': state.descCurrency,
                              'descShortCurrency': state.descShortCurrency,
                              'simbolCurrency': state.simbolCurrency,
                              'sideCurrency': state.sideCurrency
                            };
                            return ConsumerRegister(
                              l10n: l10n,
                              name: name,
                              email: email,
                              password: password,
                              repassword: repassword,
                              controllerCurrency: controllerCurrency,
                            );
                          } else {
                            return ButtonWidget(
                              onButtonClick: null,
                              text: l10n.textButtonRegister,
                            );
                          }
                        },
                      ),
                    ),

                    /// texto y link para iniciar sesion
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(l10n.textHaveAccount),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          child: Text(l10n.textSignIn),
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
    );
  }
}

class ConsumerRegister extends StatelessWidget {
  const ConsumerRegister({
    super.key,
    required this.l10n,
    required this.name,
    required this.email,
    required this.password,
    required this.repassword,
    required this.controllerCurrency,
  });

  final AppLocalizations l10n;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController repassword;
  final Map<String, dynamic> controllerCurrency;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        state.whenOrNull(
          //* ESTADO CARGADO
          loaded: (id) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/home',
              (route) => false,
              arguments: id.toString(),
            );
          },
          //* ESTADO ERROR
          error: (error) {
            final snackBar = SnackBar(
              content: Text(error),
              action: SnackBarAction(
                label: l10n.labelCloseSnackBar,
                onPressed: () {},
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => button(context),
          //* BUILDER:ESTADO INICIAL

          // initial: () {
          //   return button(context);
          // },
          //* BUILDER:ESTADO CARGANDO
          loading: () {
            return const ButtonWidget(
              onButtonClick: null,
              text: 'Cargando...',
            );
          },

          //* BUILDER:ESTADO DE ERROR
          // error: (error) {
          //   return button(context);
          // },
        );
      },
    );
  }

  ButtonWidget button(BuildContext context) {
    return ButtonWidget(
      onButtonClick: () {
        if (name.text.isEmpty ||
            email.text.isEmpty ||
            password.text.isEmpty ||
            repassword.text.isEmpty ||
            controllerCurrency['id'] as int == 0) {
          final snackBar = SnackBar(
            content: Text(l10n.errorEmptyFields),
            action: SnackBarAction(
              label: l10n.labelCloseSnackBar,
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          if (password.text == repassword.text) {
            context.read<RegisterBloc>().add(
                  RegisterEvent.load(
                    name.text,
                    email.text,
                    password.text,
                    controllerCurrency['descCurrency'] as String,
                    controllerCurrency['descShortCurrency'] as String,
                    controllerCurrency['simbolCurrency'] as String,
                    controllerCurrency['sideCurrency'] as int,
                  ),
                );
          } else {
            final snackBar = SnackBar(
              content: Text(l10n.errrPasswordNotMatch),
              action: SnackBarAction(
                label: l10n.labelCloseSnackBar,
                onPressed: () {},
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }
      },
      text: l10n.textButtonRegister,
    );
  }
}

class TitleRegisterWidget extends StatelessWidget {
  const TitleRegisterWidget({
    super.key,
    required this.l10n,
  });

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Text(
        l10n.titleSignUp,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
