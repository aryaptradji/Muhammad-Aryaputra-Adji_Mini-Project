import 'package:email_validator/email_validator.dart';
import 'package:fashion_hub/component/page_view_component.dart';
import 'package:fashion_hub/component/text_field_component.dart';
import 'package:fashion_hub/config/theme/theme_color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String firstNameValue = "";
  String lastNameValue = "";
  String emailValue = "";
  String helpValue = "";

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final helpController = TextEditingController();

  String? errorTextFirstName;
  String? errorTextLastName;
  String? errorTextEmail;

  bool isEnable = false;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    helpController.dispose();
    super.dispose();
  }

  void firstNameOnChanged(String firstNameValue) {
    if (firstNameValue.isEmpty == true) {
      errorTextFirstName = null;
      isEnable = false;
    } else if (!RegExp(r'^([a-zA-Z\.]+ ?)+$').hasMatch(firstNameValue)) {
      errorTextFirstName = 'Woops! No special characters or numbers..';
      isEnable = false;
    } else {
      errorTextFirstName = null;
      isEnable = true;
    }
  }

  void lastNameOnChanged(String lastNameValue) {
    if (lastNameValue.isEmpty == true) {
      errorTextLastName = null;
      isEnable = false;
    } else if (!RegExp(r'^([a-zA-Z\.]+ ?)+$').hasMatch(lastNameValue)) {
      errorTextLastName = "Woops! No special characters or numbers..";
      isEnable = false;
    } else {
      errorTextLastName = null;
      isEnable = true;
    }
  }

  void emailOnChanged(String emailValue) {
    if (emailValue.isEmpty == true) {
      errorTextEmail = null;
      isEnable = false;
    } else if (EmailValidator.validate(emailValue) == false) {
      errorTextEmail = "Please enter a valid email";
      isEnable = false;
    } else {
      errorTextEmail = null;
      isEnable = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: ThemeColor.primaryColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/navigation_bar.svg",
                color: Colors.white,
              ),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: CircleAvatar(
                radius: 20,
                foregroundImage: AssetImage("assets/images/profilepic.jpg"),
                backgroundColor: ThemeColor.tertiaryColor,
              ),
            ),
          ],
        ),
        backgroundColor: ThemeColor.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/logo/FashionHub_textLogo_white.png",
                  height: 70,
                ),
              ),
              Expanded(
                child: ListView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  shrinkWrap: true,
                  children: [
                    const PageViewComponent(),
                    const SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contact us.",
                            style: GoogleFonts.vidaloka(
                              color: Colors.white,
                              fontSize: 28,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Need to get in touch with us? Either fill out the form with your inquiry of find the department email you'd like to contact below.",
                            style: GoogleFonts.vidaloka(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: TextFieldComponent(
                                  controller: firstNameController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  labelText: 'First name.',
                                  onChanged: (value) {
                                    firstNameValue = value;
                                    firstNameOnChanged(firstNameValue);
                                    setState(() {});
                                  },
                                  errorText: errorTextFirstName,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Flexible(
                                flex: 1,
                                child: TextFieldComponent(
                                  controller: lastNameController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.name,
                                  labelText: 'Last name.',
                                  onChanged: (value) {
                                    lastNameValue = value;
                                    lastNameOnChanged(lastNameValue);
                                    setState(() {});
                                  },
                                  errorText: errorTextLastName,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          TextFieldComponent(
                            controller: emailController,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            labelText: 'Email.',
                            onChanged: (value) {
                              emailValue = value;
                              emailOnChanged(emailValue);
                              setState(() {});
                            },
                            errorText: errorTextEmail,
                          ),
                          const SizedBox(height: 20),
                          TextFieldComponent(
                            controller: helpController,
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            labelText: 'What we can help you with?',
                            onChanged: (value) {
                              helpValue = value;
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 20),
                          MaterialButton(
                            disabledColor: ThemeColor.secondaryColor,
                            disabledTextColor: ThemeColor.primaryColor,
                            onPressed: firstNameValue.isNotEmpty &&
                                    lastNameValue.isNotEmpty &&
                                    emailValue.isNotEmpty &&
                                    helpValue.isNotEmpty &&
                                    isEnable
                                ? () {
                                    print('Form submitted!');
                                    print('First name: $firstNameValue');
                                    print('Last name: $lastNameValue');
                                    print('Email: $emailValue');
                                    print('Help Question: $helpValue');
                                    firstNameController.clear();
                                    lastNameController.clear();
                                    emailController.clear();
                                    helpController.clear();
                                  }
                                : null,
                            color: ThemeColor.accentColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              'Submit',
                              style: GoogleFonts.vidaloka(
                                fontSize: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
