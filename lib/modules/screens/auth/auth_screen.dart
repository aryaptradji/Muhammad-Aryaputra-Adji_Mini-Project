import 'package:animate_do/animate_do.dart';
import 'package:fashion_hub/config/theme/theme_color.dart';
import 'package:fashion_hub/modules/screens/auth/auth_view_model.dart';
import 'package:fashion_hub/modules/screens/auth/login/login_screen.dart';
import 'package:fashion_hub/modules/screens/auth/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewModel>(context);

    return FadeIn(
      duration: const Duration(seconds: 5),
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .8,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/landing_image.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .8,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xCC000000),
                        Color(0x00000000),
                        Color(0x00000000),
                        Color(0xCC000000),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(height: 30),
                      FadeInDown(
                        duration: const Duration(milliseconds: 1500),
                        delay: const Duration(milliseconds: 1100),
                        child: GestureDetector(
                          onTap: () {
                            debugPrint(
                                MediaQuery.of(context).size.height.toString());
                          },
                          child: Center(
                            child: Image.asset(
                              'assets/logo/FashionHub_textLogo_white_transparentbg.png',
                              height:
                                  MediaQuery.of(context).size.height * .0807,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1500),
                        delay: const Duration(milliseconds: 1100),
                        from: 300,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 50, top: 40, right: 50, bottom: 30),
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * .85,
                            decoration: BoxDecoration(
                              color: const Color(0xff161616),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      ThemeColor.accentColor.withOpacity(0.5),
                                  offset: const Offset(0, -5),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  child: TabBar(
                                    labelColor: ThemeColor.accentColor,
                                    labelStyle:
                                        GoogleFonts.vidaloka(fontSize: 16),
                                    dividerColor: Colors.transparent,
                                    indicatorColor: ThemeColor.accentColor,
                                    unselectedLabelColor: Colors.grey,
                                    controller: authProvider.tabController,
                                    tabs: const [
                                      Tab(text: 'Login'),
                                      Tab(text: 'Register'),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: authProvider.tabController,
                                    children: const [
                                      LoginScreen(),
                                      RegisterScreen(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
