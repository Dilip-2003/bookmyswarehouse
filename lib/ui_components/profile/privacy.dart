import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/profile/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyAndPolicy extends StatefulWidget {
  const PrivacyAndPolicy({super.key});

  @override
  State<PrivacyAndPolicy> createState() => _PrivacyAndPolicyState();
}

class _PrivacyAndPolicyState extends State<PrivacyAndPolicy> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const ProfileAppBar(text: 'Privacy Policy'),
      ),
      backgroundColor: const Color(0xFFF3F3F3),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'At Warehouse on Hire, we are committed to protecting your privacy and ensuring the security of your personal information. Our Privacy Policy outlines how we collect, use, and protect the data you provide to us. By using Warehouse on Hire, you agree to our Privacy Policy.',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: BasicColor.deepBlack,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Privacy Policy covers the following areas:',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: BasicColor.deepBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    const PrivacyText(
                      headingTxt: 'Information Collection:',
                      text:
                          'We collect personal information such as your name, email address, and preferences when you sign up for Warehouse on Hire.',
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const PrivacyText(
                      headingTxt: 'Data Usage:',
                      text:
                          'We use the information collected to provide personalized experiences, improve our services, and communicate with you.',
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const PrivacyText(
                      headingTxt: 'Data Security:',
                      text:
                          'We implement security measures to safeguard your personal information from unauthorized access or disclosure.',
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const PrivacyText(
                      headingTxt: 'Information Sharing:',
                      text:
                          'We do not sell or share your personal information with third parties without your consent, except as required by law.',
                    ),
                    SizedBox(
                      height: height * 0.02,
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

class PrivacyText extends StatelessWidget {
  const PrivacyText({
    super.key,
    required this.headingTxt,
    required this.text,
  });
  final headingTxt, text;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          headingTxt,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: BasicColor.deepBlack,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          text,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: BasicColor.deepBlack,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
