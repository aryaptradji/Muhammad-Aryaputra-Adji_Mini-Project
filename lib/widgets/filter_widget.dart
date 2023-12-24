import 'package:fashion_hub/config/theme/theme_color.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const Chip(
            labelPadding: EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: ThemeColor.accentColor,
            avatar: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.filter_list,
                color: Colors.black,
              ),
            ),
            label: Text(
              "Sort by",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Chip(
            labelPadding: const EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: Colors.grey.shade900,
            label: const Text(
              "Shoes",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Chip(
            backgroundColor: ThemeColor.primaryColor,
            side: BorderSide(color: ThemeColor.primaryColor, width: 0),
            labelPadding: EdgeInsets.symmetric(horizontal: 16),
            shadowColor: ThemeColor.primaryColor,
            surfaceTintColor: ThemeColor.primaryColor,
            label: Text(
              "FW 2023",
              style: TextStyle(
                  color: ThemeColor.accentColor, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Chip(
            backgroundColor: Colors.grey.shade900,
            labelPadding: const EdgeInsets.symmetric(horizontal: 16),
            label: const Text(
              "News",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
