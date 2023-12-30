import 'package:fashion_hub/config/theme/theme_color.dart';
import 'package:fashion_hub/modules/screens/auth/auth_view_model.dart';
import 'package:fashion_hub/modules/screens/auth/login/login_view_model.dart';
import 'package:fashion_hub/modules/screens/auth/register/register_view_model.dart';
import 'package:fashion_hub/modules/screens/landing/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                RegisterViewModel(tabController: tabController)),
        ChangeNotifierProvider(
            create: (context) => LoginViewModel(tabController: tabController)),
        ChangeNotifierProvider(
            create: (context) => AuthViewModel(tabController: tabController)),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
