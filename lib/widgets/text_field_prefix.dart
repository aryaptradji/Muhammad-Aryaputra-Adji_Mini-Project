// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:fashion_hub/config/theme/theme_color.dart';

class TextFieldPrefix extends StatelessWidget {
  final String labelText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final String? Function(String?)? validator;
  final String? errorText;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  const TextFieldPrefix({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.obscureText,
    this.suffixIcon,
    this.textInputAction,
    this.keyboardType,
    this.errorText,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          validator: validator,
          style: GoogleFonts.vidaloka(
            color: focusNode.hasFocus == true
                ? Colors.white
                : ThemeColor.accentColor,
            fontSize: 18,
          ),
          obscureText: obscureText,
          cursorColor: ThemeColor.accentColor,
          maxLines: 1,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            prefixIcon: prefixIcon,
            prefixIconColor: controller.text.isNotEmpty || focusNode.hasFocus
                ? ThemeColor.accentColor
                : Colors.white,
            suffixIcon: suffixIcon,
            suffixIconColor: controller.text.isNotEmpty || focusNode.hasFocus
                ? ThemeColor.accentColor
                : Colors.white,
            filled: true,
            fillColor: const Color(0xff2d2d2e),
            labelText: labelText,
            labelStyle: GoogleFonts.vidaloka(color: Colors.white),
            floatingLabelStyle:
                GoogleFonts.vidaloka(color: ThemeColor.accentColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: controller.text.isNotEmpty
                    ? ThemeColor.accentColor
                    : Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: ThemeColor.accentColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.red,
                width: 2,
              ),
            ),
            errorText: errorText,
            errorStyle: GoogleFonts.vidaloka(fontSize: 14),
            errorMaxLines: 2,
          ),
        ),
      ),
    );
  }
}
