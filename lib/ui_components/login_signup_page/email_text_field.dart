import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailTextComponents extends StatelessWidget {
  const EmailTextComponents(
      {super.key,
      required this.userName,
      required this.icons,
      required this.emailText,
      required this.colors});
  final String emailText, userName;
  final Icon icons;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var emailController = TextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          userName,
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.02,
              color: Color(0xFF1A1E25),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(81),
            color: colors,
          ),
          height: height * 0.07,
          child: TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: icons,
              hintText: emailText,
              hintStyle: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.02,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(81),
              ),
            ),
          ),
        )
      ],
    );
  }
}
