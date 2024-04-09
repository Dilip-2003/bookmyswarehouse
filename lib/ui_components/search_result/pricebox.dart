import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceBox extends StatelessWidget {
  const PriceBox({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).width * 0.08,
      width: MediaQuery.sizeOf(context).width * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: BasicColor.deepWhite,
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.02,
              color: BasicColor.deepBlack,
            ),
          ),
        ),
      ),
    );
  }
}
