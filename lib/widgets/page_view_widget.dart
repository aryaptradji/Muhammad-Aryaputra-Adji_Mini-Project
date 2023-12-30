import 'dart:async';
import 'package:fashion_hub/config/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key});

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  int pageIndex = 0;
  int _currentPage = 0;

  Timer? _timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height / 1.8,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: ThemeColor.tertiaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: PageView(
                  controller: _pageController,
                  allowImplicitScrolling: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          "assets/images/pic0.jpg",
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 36),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Settle your ",
                                  style: GoogleFonts.vidaloka(
                                    color: ThemeColor.primaryColor,
                                    fontSize: 30,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "fashion.",
                                      style: GoogleFonts.vidaloka(
                                        color: ThemeColor.accentColorDarker10,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: ThemeColor.primaryColor,
                                height: 50,
                                thickness: 1,
                                endIndent: 300,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          "assets/images/pic1.jpg",
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, top: 290),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Everyday ",
                                  style: GoogleFonts.vidaloka(
                                    color: ThemeColor.primaryColor,
                                    fontSize: 30,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "comfort.",
                                      style: GoogleFonts.vidaloka(
                                        color: ThemeColor.accentColorDarker10,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: ThemeColor.primaryColor,
                                height: 50,
                                thickness: 1,
                                endIndent: 300,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          "assets/images/pic2.jpg",
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 250),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Effortless ",
                                  style: GoogleFonts.vidaloka(
                                    color: ThemeColor.tertiaryColor,
                                    fontSize: 30,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "elegance.",
                                      style: GoogleFonts.vidaloka(
                                        color: ThemeColor.accentColorDarker10,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: ThemeColor.tertiaryColor,
                                height: 50,
                                thickness: 1,
                                endIndent: 150,
                                indent: 150,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          Positioned(
            bottom: 40,
            left: MediaQuery.of(context).size.width / 3,
            right: MediaQuery.of(context).size.width / 3,
            child: SizedBox(
              height: 42,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  addRepaintBoundaries: true,
                  itemCount: 3,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: AnimatedContainer(
                          duration: const Duration(milliseconds: 375),
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          height: 6,
                          width: pageIndex == index ? 40 : 30,
                          decoration: BoxDecoration(
                            color: pageIndex == index
                                ? Colors.white
                                : ThemeColor.primaryColor,
                            borderRadius: BorderRadius.circular(15),
                          )),
                    );
                  }),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 120,
            right: MediaQuery.of(context).size.width / 2 - 120,
            bottom: -25,
            child: MaterialButton(
              onPressed: () {},
              height: 60,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              color: ThemeColor.accentColor,
              child: Text(
                "Shop Now",
                style: GoogleFonts.vidaloka(
                  color: ThemeColor.primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
