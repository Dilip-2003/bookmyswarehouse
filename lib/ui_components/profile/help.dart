import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/profile/about.dart';
import 'package:bookmywarehouse/ui_components/profile/appbar.dart';
import 'package:bookmywarehouse/ui_components/profile/feedback.dart';
import 'package:bookmywarehouse/ui_components/profile/help_and_support.dart';
import 'package:bookmywarehouse/ui_components/profile/privacy.dart';
import 'package:bookmywarehouse/ui_components/profile/terms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpAndSupport extends StatefulWidget {
  const HelpAndSupport({super.key});

  @override
  State<HelpAndSupport> createState() => _HelpAndSupportState();
}

class _HelpAndSupportState extends State<HelpAndSupport> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const ProfileAppBar(text: 'Help and Support'),
      ),
      backgroundColor: const Color(0xFFF3F3F3),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: width * 0.03,
          ),
          child: Column(
            children: [
              Text(
                'Get assistance and find answers to your questions:',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: BasicColor.deepBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              HelpText(
                callback: () {
                  Get.defaultDialog(
                    title: "Under Process",
                    middleText: "This page is under process",
                    textConfirm: "OK",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      Get.back();
                    },
                  );
                },
                text: 'Contact Us',
              ),
              SizedBox(
                height: height * 0.01,
              ),
              HelpText(
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Help(),
                    ),
                  );
                },
                text: 'Help and Support',
              ),
              SizedBox(
                height: height * 0.01,
              ),
              HelpText(
                callback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrivacyAndPolicy(),
                      ));
                },
                text: 'Privacy Policy',
              ),
              SizedBox(
                height: height * 0.01,
              ),
              HelpText(
                callback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TermsOfServices(),
                      ));
                },
                text: 'Terms of Service',
              ),
              SizedBox(
                height: height * 0.01,
              ),
              HelpText(
                callback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FeedBackScreen(),
                    ),
                  );
                },
                text: 'Feedback',
              ),
              SizedBox(
                height: height * 0.01,
              ),
              HelpText(
                callback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutUs(),
                      ));
                },
                text: 'About Us',
              ),
              SizedBox(
                height: height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class HelpText extends StatelessWidget {
  HelpText({super.key, required this.text, required this.callback});
  final String text;
  VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: BasicColor.deepBlack,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: BasicColor.primary,
              borderRadius: BorderRadius.circular(50)),
          child: IconButton(
            onPressed: callback,
            icon: Icon(
              Icons.keyboard_arrow_right_rounded,
              color: BasicColor.deepWhite,
              size: 30,
            ),
          ),
        )
      ],
    );
  }
}
