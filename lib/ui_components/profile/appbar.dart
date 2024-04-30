import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Profile',
      style: GoogleFonts.lato(
          textStyle: TextStyle(
        color: Color(0xFF222222),
        fontSize: 18,
        fontWeight: FontWeight.w600,
      )),
    );
  }
}
