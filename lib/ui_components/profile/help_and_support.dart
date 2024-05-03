import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/profile/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const ProfileAppBar(text: 'Help and Support'),
      ),
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
                  'Help and Support',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: BasicColor.deepBlack,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "At Warehouse on Hire, we prioritize providing exceptional support to our valued customers. Our dedicated support team is available around the clock to assist you with any inquiries, technical issues, or concerns you may have. Whether you're seeking guidance on using our products or need troubleshooting assistance, we're here to ensure your experience with us is seamless and satisfactory. Please don't hesitate to reach out to us via phone, email, or live chat for prompt and personalized assistance. Your satisfaction is our top priority, and we are committed to going above and beyond to meet your needs.",
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: BasicColor.deepBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
