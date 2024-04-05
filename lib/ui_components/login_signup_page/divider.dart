import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DividerOR extends StatelessWidget {
  const DividerOR({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: 60,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Divider(
              thickness: 1,
              color: Color(0xFFEBE8F6),
            ),
          ),
          Positioned(
            left: width * 0.35,
            bottom: 5,
            child: Container(
              width: width * 0.2,
              height: height * 0.05,
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              decoration: BoxDecoration(
                color: Color(0xFFF3F0FF),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  'OR',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.08,
                      color: Color(0xFF9E91DA),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
