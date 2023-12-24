import 'package:fashion_hub/component/navbar_component.dart';
import 'package:fashion_hub/modules/home/screens/home_screen.dart';
import 'package:fashion_hub/config/theme/theme_color.dart';
import 'package:fashion_hub/modules/landing/screen/landing_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ThemeColor.primaryColor,
        buttonTheme: const ButtonThemeData(
          buttonColor: ThemeColor.accentColor,
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: ThemeColor.secondaryColor,
        ),
      ),
      home: const LandingScreen(),
    );
  }
}
