import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingButton extends StatelessWidget {
  const BookingButton({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.02),
      child: InkWell(
        onTap: () {
          print('booking button pressed');
        },
        child: Container(
          width: width * 0.9,
          height: height * 0.07,
          decoration: BoxDecoration(
              color: BasicColor.primary,
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Text(
              'Place booking request',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 20,
                    color: BasicColor.deepWhite,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
