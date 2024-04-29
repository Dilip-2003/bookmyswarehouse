import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecoverText extends StatelessWidget {
  const RecoverText({super.key, required this.text, required this.text1});
  final String text, text1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          text1,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.02,
              color: BasicColor.deepBlack,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.02,
              color: BasicColor.deepBlack,
            ),
          ),
        ),
      ],
    );
  }
}
