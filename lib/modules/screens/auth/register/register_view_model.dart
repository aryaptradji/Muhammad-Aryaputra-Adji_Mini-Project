import 'package:flutter/material.dart';

class RegisterViewModel extends ChangeNotifier {
  final TabController tabController;
  RegisterViewModel({required this.tabController});

  final TextEditingController _nameController = TextEditingController();
  TextEditingController get nameController => _nameController;
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;
  final TextEditingController _numberController = TextEditingController();
  TextEditingController get numberController => _numberController;
  final TextEditingController _passController = TextEditingController();
  TextEditingController get passController => _passController;
  final TextEditingController _repPassController = TextEditingController();
  TextEditingController get repPassController => _repPassController;

  final FocusNode _nameFocus = FocusNode();
  FocusNode get nameFocus => _nameFocus;
  final FocusNode _emailFocus = FocusNode();
  FocusNode get emailFocus => _emailFocus;
  final FocusNode _numberFocus = FocusNode();
  FocusNode get numberFocus => _numberFocus;
  final FocusNode _passFocus = FocusNode();
  FocusNode get passFocus => _passFocus;
  final FocusNode _repPassFocus = FocusNode();
  FocusNode get repPassFocus => _repPassFocus;

  // ignore: prefer_final_fields
  bool _isHidePass = true;
  bool get isHidePass => _isHidePass;
  // ignore: prefer_final_fields
  bool _isHideRepPass = true;
  bool get isHideRepPass => _isHideRepPass;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    _passController.dispose();
    _repPassController.dispose();
    super.dispose();
  }

  void changeScreen() {
    tabController.index = 0;
    _nameController.clear();
    _emailController.clear();
    _numberController.clear();
    _passController.clear();
    _repPassController.clear();
    _nameFocus.unfocus();
    _emailFocus.unfocus();
    _numberFocus.unfocus();
    _passFocus.unfocus();
    _repPassFocus.unfocus();
    notifyListeners();
  }
}
