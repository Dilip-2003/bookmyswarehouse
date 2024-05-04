import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Watch360 extends StatelessWidget {
  const Watch360({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width * 0.9,
      height: height * 0.065,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF917AFD), width: 1),
        borderRadius: BorderRadius.circular(81),
        color: const Color.fromARGB(255, 215, 209, 240).withOpacity(0.7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.video_call_rounded,
            color: BasicColor.primary,
            size: width * 0.08,
          ),
          Text(
            '  Watch 360°',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: BasicColor.primary),
            ),
          )
        ],
      ),
    );
  }
}
