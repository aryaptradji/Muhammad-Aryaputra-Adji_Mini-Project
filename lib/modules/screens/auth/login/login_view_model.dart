import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginViewModel extends ChangeNotifier {
  final TabController tabController;
  LoginViewModel({required this.tabController});

  // ignore: prefer_final_fields
  String _emailValue = "";
  String get emailValue => _emailValue;
  void setEmailValue(String value) {
    _emailValue = value;
  }

  // ignore: prefer_final_fields
  String _passwordValue = "";
  String get passwordValue => _passwordValue;
  void setPasswordValue(String value) {
    _passwordValue = value;
  }

  String? _emailErrorText;
  String? get emailErrorText => _emailErrorText;
  String? _passwordErrorText;
  String? get passwordErrorText => _passwordErrorText;

  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  final FocusNode _emailFocus = FocusNode();
  FocusNode get emailFocus => _emailFocus;
  final FocusNode _passwordFocus = FocusNode();
  FocusNode get passwordFocus => _passwordFocus;

  // ignore: prefer_final_fields
  bool _isHidePassword = true;
  bool get isHidePassword => _isHidePassword;

  LottieBuilder? _lottie;
  LottieBuilder? get lottie => _lottie;

  final _loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> get loginKey => _loginKey;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    tabController.dispose();
    super.dispose();
  }

  void showHidePassword() {
    _isHidePassword = !_isHidePassword;
    notifyListeners();
  }

  Future<LottieBuilder> getLottieNetwork() async {
    final lottieBuilder = Lottie.network(
      'https://lottie.host/a66aa750-8a2c-42ce-84af-79ce11622821/8KNjPx2BXQ.json',
      fit: BoxFit.cover,
      height: 210,
      errorBuilder: (context, object, stacktrace) {
        return Padding(
          padding: const EdgeInsets.only(top: 54, bottom: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.close_rounded,
                color: Colors.red,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                'Unable to load asset',
                style: GoogleFonts.vidaloka(color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
    return lottieBuilder;
  }

  void emailOnChanged() {
    if (_emailValue.isEmpty == true) {
      _emailErrorText = null;
      notifyListeners();
    } else if (EmailValidator.validate(_emailValue) == false) {
      _emailErrorText = "Please enter a valid email!";
      notifyListeners();
    } else {
      _emailErrorText = null;
      notifyListeners();
    }
  }

  void passwordOnChanged() {
    if (_passwordValue.isEmpty == true) {
      _passwordErrorText = null;
      notifyListeners();
    } else if (!RegExp(r'^(.*[A-Z]+.* *.*)+$').hasMatch(_passwordValue)) {
      _passwordErrorText = "Password should contain at least 1 Upper Case!";
      notifyListeners();
    } else if (!RegExp(r'^(.*[a-z]+.* *.*)+$').hasMatch(_passwordValue)) {
      _passwordErrorText = "Password should contain at least 1 Lower Case!";
      notifyListeners();
    } else if (!RegExp(r'^(.*[0-9]+.* *.*)+$').hasMatch(_passwordValue)) {
      _passwordErrorText = "Password should contain at least 1 digit!";
      notifyListeners();
    } else if (!RegExp(r'^(.*[^A-Za-z0-9\s]+.* *.*)+$')
        .hasMatch(_passwordValue)) {
      _passwordErrorText =
          "Password should contain at least 1 special character!";
      notifyListeners();
    } else if (!RegExp(r'^.{8,}$').hasMatch(_passwordValue)) {
      _passwordErrorText = "Password must be at least 8 characters in length!";
      notifyListeners();
    } else {
      _passwordErrorText = null;
      notifyListeners();
    }
  }

  String? emailValidator(String? value) {
    if (value?.isEmpty == true) {
      return "Please enter your email!";
    } else if (_emailErrorText != null) {
      return "Please enter a valid email!";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value?.isEmpty == true) {
      return "Please enter your password!";
    } else if (_passwordErrorText != null) {
      return "Please enter a correct password!";
    }
    return null;
  }

  void validateLogin() {
    if (_loginKey.currentState?.validate() == true) {
      debugPrint("Validate Login");
    }
  }

  void changeScreen() {
    tabController.index = 1;
    _emailController.clear();
    _passwordController.clear();
    _emailFocus.unfocus();
    _passwordFocus.unfocus();
    _emailErrorText = null;
    _passwordErrorText = null;
    notifyListeners();
  }
}
