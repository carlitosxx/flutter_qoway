import 'package:flutter/material.dart';
import 'package:qoway/l10n/l10n.dart';
import 'package:qoway/ui/common/widgets/button.dart';
import 'package:qoway/ui/common/widgets/field.dart';
import 'package:qoway/ui/common/widgets/logo.dart';

class RegisterPhoneView extends StatelessWidget {
  RegisterPhoneView({super.key});
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final repassword = TextEditingController();
  final currency = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                            child: Text(
                              l10n.hintCurrencyRegister,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.3),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// boton registrar
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 7, 30, 0),
                      width: double.infinity,
                      child: ButtonWidget(
                        onButtonClick: null,
                        text: l10n.textButtonRegister,
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
