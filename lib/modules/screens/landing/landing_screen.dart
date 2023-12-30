import 'package:animate_do/animate_do.dart';
import 'package:fashion_hub/config/theme/theme_color.dart';
import 'package:fashion_hub/modules/screens/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(seconds: 5),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              FadeInDown(
                duration: const Duration(milliseconds: 1000),
                child: Container(
                  height: MediaQuery.of(context).size.height * .8,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/landing_image.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
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
              FadeInUp(
                duration: const Duration(milliseconds: 2000),
                delay: const Duration(milliseconds: 1500),
                from: 100,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 50, top: 40, right: 30, bottom: 30),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 22, 22, 22),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: ThemeColor.accentColor.withOpacity(0.5),
                          offset: const Offset(0, -5),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FadeInUp(
                          duration: const Duration(milliseconds: 2500),
                          delay: const Duration(milliseconds: 1000),
                          from: 50,
                          child: Text(
                            'Discover your \nfashion in our hub.',
                            style: GoogleFonts.vidaloka(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        FadeInUp(
                          duration: const Duration(milliseconds: 2500),
                          delay: const Duration(milliseconds: 1000),
                          from: 60,
                          child: Text(
                            'Experience fashion like never before.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.vidaloka(
                              fontSize: 14,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 50),
                        FadeInUp(
                          duration: const Duration(milliseconds: 2500),
                          delay: const Duration(milliseconds: 1000),
                          from: 70,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: FadeInRight(
                              duration: const Duration(milliseconds: 2500),
                              delay: const Duration(milliseconds: 1000),
                              child: MaterialButton(
                                padding: const EdgeInsets.only(
                                    left: 14, right: 5, top: 10, bottom: 10),
                                color: ThemeColor.accentColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                onPressed: () {
                                  // direct to login screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AuthScreen(),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    FadeInLeft(
                                      duration:
                                          const Duration(milliseconds: 2500),
                                      delay: const Duration(milliseconds: 1300),
                                      child: Text(
                                        'EXPLORE NOW',
                                        style: GoogleFonts.vidaloka(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    FadeInLeft(
                                      duration:
                                          const Duration(milliseconds: 2000),
                                      delay: const Duration(milliseconds: 1300),
                                      child: const Icon(
                                        Icons.navigate_next_rounded,
                                        size: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
