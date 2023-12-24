import 'package:fashion_hub/modules/home/screens/home_screen.dart';
import 'package:fashion_hub/config/theme/theme_color.dart';
import 'package:fashion_hub/modules/product/screens/product_screen.dart';
import 'package:flutter/material.dart';

List<Widget> screens = [
  const HomeScreen(),
  const ProductsScreen(),
];

class NavBarComponent extends StatefulWidget {
  const NavBarComponent({super.key});

  @override
  State<NavBarComponent> createState() => _NavBarComponentState();
}

class _NavBarComponentState extends State<NavBarComponent> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.primaryColor,
      body: screens[_currentIndex],
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey.shade900,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
        selectedFontSize: 0,
        iconSize: 30,
        enableFeedback: true,
        unselectedFontSize: 0,
        onTap: (index) {
          if (index <= 1) {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        selectedItemColor: ThemeColor.accentColor,
        unselectedItemColor: ThemeColor.tertiaryColor.withOpacity(0.8),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.space_dashboard_rounded),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
        ],
      ),
    );
  }
}
