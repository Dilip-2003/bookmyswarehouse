import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Heading extends StatelessWidget {
  Heading({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height * 0.06,
      width: width * 0.9,
      child: Text(
        title,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w700,
                color: BasicColor.deepBlack)),
      ),
    );
  }
}
