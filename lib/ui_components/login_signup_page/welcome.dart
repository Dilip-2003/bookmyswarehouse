import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeColum extends StatelessWidget {
  const WelcomeColum({super.key, required this.text1, required this.text2});
  final String text1, text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: GoogleFonts.plusJakartaSans(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.02,
              color: Color(0xFF1A1E25),
            ),
          ),
        ),
        Text(
          text2,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.02,
              color: Color(0xFF7D7F88),
            ),
          ),
        )
      ],
    );
  }
}
