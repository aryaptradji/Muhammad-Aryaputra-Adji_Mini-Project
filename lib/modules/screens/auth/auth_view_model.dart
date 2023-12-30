import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final TabController tabController;
  AuthViewModel({required this.tabController});

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
