import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSectionOne extends StatelessWidget {
  const ProfileSectionOne({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height * 0.3,
      width: width * 0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: const AssetImage("assets/images/owner_img.png"),
            radius: width * 0.1,
          ),
          Text(
            'Dilip Sarkar',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 22,
                  letterSpacing: 0.13,
                  color: BasicColor.deepBlack,
                  fontWeight: FontWeight.w800),
            ),
          ),
          Text(
            'xyz@gmail.com',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 20,
                letterSpacing: 0.13,
                color: Color(0xFF7D7F88),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
