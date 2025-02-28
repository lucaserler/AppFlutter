import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_text_field.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  final phoneFormatter = MaskTextInputFormatter(
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customSwatchtColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: GoogleFonts.satisfy(
                          fontSize: 50,
                          color: CustomColors.customContrastColorNomeApp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  //FORMULARIO
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustonTextField(
                          icon: Icons.email,
                          label: 'Email',
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Digite seu email!';
                            }
                            if (!email.isEmail) {
                              return 'Digite um email valido!';
                            }
                            return null;
                          },
                        ),
                        CustonTextField(
                          icon: Icons.password,
                          label: 'Senha',
                          isSecret: true,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Digite sua senha!';
                            }
                            if (password.length < 7) {
                              return 'Digite uma senha com pelo menos 7 caracteres!';
                            }
                            return null;
                          },
                        ),
                        CustonTextField(
                          icon: Icons.person,
                          label: 'Nome',
                          validator: (null),
                        ),
                        CustonTextField(
                          icon: Icons.phone,
                          label: 'Celular',
                          inputFormatters: [phoneFormatter],
                          validator: (null),
                        ),
                        CustonTextField(
                          icon: Icons.file_copy,
                          label: 'CPF',
                          inputFormatters: [cpfFormatter],
                          validator: (null),
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Cadastrar usuáiro',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: CustomColors.customContrastColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
