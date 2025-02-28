import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/pages/auth/view/components/forgot_password_dialog.dart';
import 'package:greengrocer/src/pages/common_widgets/app_name_widget.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/pages/splash/pages_routes/app_pages.dart';
import 'package:greengrocer/src/services/utils_services.dart';
import 'package:greengrocer/src/services/validators.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  //Controlador de campos
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customSwatchtColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //NOME DO APP
                    AppNameWidget(
                      greenTileColor: CustomColors.customContrastColorNomeApp,
                      textSize: 40,
                    ),
                    //CATEGORIA
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Verduras'),
                            FadeAnimatedText('Legumes'),
                            FadeAnimatedText('Carnes'),
                            FadeAnimatedText('Cereais'),
                            FadeAnimatedText('Laticíneos'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //FORMULÁRIO
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 254, 254, 254),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //EMAIL
                        CustomTextField(
                          textInputType: TextInputType.emailAddress,
                          controller: emailController,
                          icon: Icons.email,
                          label: 'Email',
                          validator: emailValidator,
                        ),
                        //SENHA
                        CustomTextField(
                          controller: passwordController,
                          icon: Icons.password,
                          label: 'Senha',
                          isSecret: true,
                          validator: passwordValidator,
                        ),
                        //BOTÃO ENTRAR
                        SizedBox(
                            height: 50,
                            child:
                                GetX<AuthController>(builder: (authController) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      CustomColors.customContrastColor,
                                  foregroundColor:
                                      CustomColors.customSwatchtColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                onPressed: authController.isLoading.value
                                    ? null
                                    : () {
                                        FocusScope.of(context).unfocus();
                                        if (_formKey.currentState!.validate()) {
                                          String email = emailController.text;
                                          String password =
                                              passwordController.text;
                                          authController.signIn(
                                              email: email, password: password);
                                        }
                                        Get.toNamed(PagesRoutes.baseRoute);
                                      },
                                child: authController.isLoading.value
                                    ? CircularProgressIndicator()
                                    : Text(
                                        'Entrar',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                              );
                            })),
                        //BOTÃO ESQUECEU A SENHA
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () async {
                              final bool? result = await showDialog(
                                context: context,
                                builder: (_) {
                                  return ForgotPasswordDialog(
                                    email: emailController.text,
                                  );
                                },
                              );
                              if (result ?? false) {
                                utilsServices.showToast(
                                  message:
                                      'O link de recuperação foi enviado para o seu email!',
                                );
                              }
                            },
                            child: Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                color: CustomColors.customContrastColor,
                              ),
                            ),
                          ),
                        ),
                        //DIVISOR
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.blueGrey.withAlpha(90),
                                  thickness: 1.5,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text('OU'),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.blueGrey.withAlpha(90),
                                  thickness: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //BOTÃO NOVA CONTA
                        SizedBox(
                          height: 50,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor:
                                  CustomColors.customContrastColorNomeApp,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              side: BorderSide(
                                width: 2,
                                color: CustomColors.customContrastColorNomeApp,
                              ),
                            ),
                            onPressed: () {
                              Get.toNamed(PagesRoutes.signUpRoute);
                            },
                            child: const Text(
                              'Criar conta',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
