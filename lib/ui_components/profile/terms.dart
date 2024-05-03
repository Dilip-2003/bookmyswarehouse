import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/profile/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsOfServices extends StatefulWidget {
  const TermsOfServices({super.key});

  @override
  State<TermsOfServices> createState() => _TermsOfServicesState();
}

class _TermsOfServicesState extends State<TermsOfServices> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: ProfileAppBar(text: 'Terms of Services'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            children: [
              Text(
                'Welcome to Warehouse on Hire! These Terms of Service ("Terms") govern your use of the Warehouse on Hire application and services provided by us. By accessing or using Warehouse on Hire, you agree to abide by these Terms and our Privacy Policy.',
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
                  horizontal: width * 0.05,
                  vertical: height * 0.02,
                ),
                child: Text(
                  'Welcome to Warehouse on Hire! These Terms of Service govern your access to and use of our website, products, and services. By accessing or using any part of our services, you agree to be bound by these Terms. Please read them carefully before using our services. If you do not agree with any part of these Terms, you may not access or use our services. Our services are intended for users who are at least 18 years old. You are responsible for maintaining the confidentiality of your account and password and for restricting access to your account. You agree to accept responsibility for all activities that occur under your account. We reserve the right to modify or terminate our services or these Terms at any time, without prior notice. It is your responsibility to review these Terms periodically for changes. Your continued use of our services after any modifications indicates your acceptance of the updated Terms.',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: BasicColor.deepBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
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
