import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LoginButton extends StatelessWidget {
  LoginButton(
      {super.key,
      required this.btnText,
      required this.callback,
      required this.color,
      required this.borderColor,
      required this.textColor});
  final String btnText;
  final Color color, borderColor, textColor;
  VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: callback,
      child: Container(
        height: height * 0.07,
        width: width * 0.9,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(81),
          border: Border.all(width: 1, color: borderColor),
        ),
        child: Center(
          child: Text(
            btnText,
            style: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
