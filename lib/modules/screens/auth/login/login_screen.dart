import 'package:fashion_hub/config/theme/theme_color.dart';
import 'package:fashion_hub/modules/screens/auth/login/login_view_model.dart';
import 'package:fashion_hub/modules/screens/auth/register/register_view_model.dart';
import 'package:fashion_hub/utils/stateful_helper.dart';
import 'package:fashion_hub/widgets/text_field_prefix.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterViewModel>(context);

    return StatefulHelper(
      onInit: () => registerProvider.changeScreen(),
      child: SingleChildScrollView(
        child: Consumer<LoginViewModel>(
          builder: (context, loginProvider, child) {
            final emailController = loginProvider.emailController;
            final passwordController = loginProvider.passwordController;

            final emailErrorText = loginProvider.emailErrorText;
            final passwordErrorText = loginProvider.passwordErrorText;

            final emailFocus = loginProvider.emailFocus;
            final passwordFocus = loginProvider.passwordFocus;

            bool isHidePassword = loginProvider.isHidePassword;
            return Form(
              key: loginProvider.loginKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 14),
                  FutureBuilder(
                      future: loginProvider.getLottieNetwork(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: ThemeColor.accentColor,
                              strokeCap: StrokeCap.round,
                            ),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return Center(child: snapshot.data);
                        }
                        return const Center(child: SizedBox(height: 210));
                      }),
                  Center(
                    child: Text(
                      'Welcome Back!',
                      style: GoogleFonts.vidaloka(
                          color: Colors.white, fontSize: 26),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      'Please login to continue.',
                      style: GoogleFonts.vidaloka(
                          color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFieldPrefix(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.mail),
                    controller: emailController,
                    focusNode: emailFocus,
                    onChanged: (value) {
                      loginProvider.setEmailValue(value);
                      loginProvider.emailOnChanged();
                    },
                    // validator: (value) {
                    //   return loginProvider.emailValidator(value);
                    // },
                    // errorText: emailErrorText,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  TextFieldPrefix(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        loginProvider.showHidePassword();
                      },
                      child: Icon(
                        isHidePassword
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                      ),
                    ),
                    controller: passwordController,
                    focusNode: passwordFocus,
                    onChanged: (value) {
                      loginProvider.setPasswordValue(value);
                      loginProvider.passwordOnChanged();
                    },
                    // validator: (value) {
                    //   return loginProvider.passwordValidator(value);
                    // },
                    // errorText: passwordErrorText,
                    obscureText: isHidePassword,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: MaterialButton(
                      onPressed: () {
                        loginProvider.validateLogin();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      color: ThemeColor.accentColor,
                      child: Text(
                        'LOGIN',
                        style: GoogleFonts.vidaloka(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: GoogleFonts.vidaloka(color: Colors.white),
                      children: [
                        TextSpan(
                          text: 'Register',
                          style: GoogleFonts.vidaloka(
                              color: ThemeColor.accentColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              loginProvider.changeScreen();
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
