import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailTextComponents extends StatefulWidget {
  const EmailTextComponents({
    super.key,
    required this.userName,
  });
  final String userName;
  @override
  State<EmailTextComponents> createState() => _EmailTextComponentsState();
}

class _EmailTextComponentsState extends State<EmailTextComponents> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.userName,
      style: GoogleFonts.poppins(
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.02,
          color: Color(0xFF1A1E25),
        ),
      ),
    );
  }
}
