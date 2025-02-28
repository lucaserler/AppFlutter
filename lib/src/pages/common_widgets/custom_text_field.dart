import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:greengrocer/src/config/custom_colors.dart';

class CustonTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final String? initialValue;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;

  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustonTextField({
    super.key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.initialValue,
    this.readOnly = false,
    this.inputFormatters,
    required this.validator,
    this.controller,
  });

  @override
  State<CustonTextField> createState() => _CustonTextFieldState();
}

class _CustonTextFieldState extends State<CustonTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        decoration: InputDecoration(
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon:
                      Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          prefixIcon: Icon(widget.icon),
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: CustomColors
                  .customSwatchtColor, // Cor da borda quando o campo não está focado
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: CustomColors
                  .customContrastColorNomeApp, // Cor da borda quando o campo está focado
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: CustomColors
                  .customContrastColor, // Cor da borda quando há um erro
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
