import 'package:fashion_hub/modules/screens/auth/login/login_view_model.dart';
import 'package:fashion_hub/modules/screens/auth/register/register_view_model.dart';
import 'package:fashion_hub/utils/stateful_helper.dart';
import 'package:fashion_hub/widgets/text_field_prefix.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginViewModel>(context);

    return StatefulHelper(
      onInit: () => loginProvider.changeScreen(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 14),
            Center(
              child: Text(
                'Welcome to The Hub!',
                style: GoogleFonts.vidaloka(color: Colors.white, fontSize: 26),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Text(
                "Let's create an account for you.",
                style: GoogleFonts.vidaloka(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),
            Consumer<RegisterViewModel>(
              builder: (context, registerProvider, child) {
                final nameController = registerProvider.nameController;
                final nameFocus = registerProvider.nameFocus;
                return TextFieldPrefix(
                  labelText: 'Name',
                  prefixIcon: const Icon(Icons.person),
                  controller: nameController,
                  focusNode: nameFocus,
                  onChanged: (value) {},
                  obscureText: false,
                );
              },
            ),
            const SizedBox(height: 16),
            Consumer<RegisterViewModel>(
              builder: (context, registerProvider, child) {
                final emailController = registerProvider.emailController;
                final emailFocus = registerProvider.emailFocus;
                return TextFieldPrefix(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.mail),
                  controller: emailController,
                  focusNode: emailFocus,
                  onChanged: (value) {},
                  obscureText: false,
                );
              },
            ),
            const SizedBox(height: 16),
            Consumer<RegisterViewModel>(
              builder: (context, registerProvider, child) {
                final numberController = registerProvider.numberController;
                final numberFocus = registerProvider.numberFocus;
                return TextFieldPrefix(
                  labelText: 'Number',
                  prefixIcon: const Icon(Icons.phone),
                  controller: numberController,
                  focusNode: numberFocus,
                  onChanged: (value) {},
                  obscureText: false,
                );
              },
            ),
            const SizedBox(height: 16),
            Consumer<RegisterViewModel>(
              builder: (context, registerProvider, child) {
                final passController = registerProvider.passController;
                final passFocus = registerProvider.passFocus;
                final isHidePass = registerProvider.isHidePass;
                return TextFieldPrefix(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  controller: passController,
                  focusNode: passFocus,
                  onChanged: (value) {},
                  obscureText: isHidePass,
                  suffixIcon: Icon(
                    isHidePass
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            Consumer<RegisterViewModel>(
              builder: (context, registerProvider, child) {
                final repPassController = registerProvider.repPassController;
                final repPassFocus = registerProvider.repPassFocus;
                final isHideRepPass = registerProvider.isHideRepPass;
                return TextFieldPrefix(
                  labelText: 'Repeat Password',
                  prefixIcon: const Icon(Icons.lock),
                  controller: repPassController,
                  focusNode: repPassFocus,
                  onChanged: (value) {},
                  obscureText: isHideRepPass,
                  suffixIcon: Icon(
                    isHideRepPass
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
