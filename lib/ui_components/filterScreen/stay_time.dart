import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StayTime extends StatelessWidget {
  const StayTime({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(top: width * 0.02),
          padding: EdgeInsets.only(left: width * 0.04),
          height: height * 0.062,
          width: width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(81),
            color: const Color(0xFFE3E3E7),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.calendar_month,
                size: 30,
              ),
              Text(
                '  11 Nov - 5 Dec',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.02,
                    color: BasicColor.deepBlack,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
