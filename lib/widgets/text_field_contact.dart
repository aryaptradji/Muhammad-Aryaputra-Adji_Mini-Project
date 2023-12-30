// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/theme/theme_color.dart';

class TextFieldContact extends StatelessWidget {
  final String? labelText;
  final String? errorText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final int? maxLines;

  const TextFieldContact({
    Key? key,
    required this.labelText,
    required this.onChanged,
    this.errorText,
    this.textInputAction,
    this.keyboardType,
    this.maxLines,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.vidaloka(
        fontSize: 12,
        color: ThemeColor.accentColor,
      ),
      onChanged: onChanged,
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        errorText: errorText,
        labelText: labelText,
        labelStyle: GoogleFonts.vidaloka(
          fontSize: 12,
          color: ThemeColor.tertiaryColor,
        ),
        floatingLabelStyle: GoogleFonts.vidaloka(
          fontSize: 18,
          color: ThemeColor.accentColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: ThemeColor.accentColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: ThemeColor.tertiaryColor,
            )),
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
          ),
        ),
        errorMaxLines: 2,
      ),
    );
  }
}
