import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecoverOptionsCard extends StatelessWidget {
  const RecoverOptionsCard(
      {super.key,
      required this.txt1,
      required this.txt2,
      required this.icon,
      required this.callback});
  final String txt1, txt2;
  final Icon icon;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return Container(
      padding: EdgeInsets.only(left: width * 0.02),
      width: width * 0.9,
      height: height * 0.09,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: BasicColor.primary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          icon,
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  txt1,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.02,
                      color: BasicColor.deepBlack,
                    ),
                  ),
                ),
                Text(
                  txt2,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 0.02,
                      color: BasicColor.deepBlack,
                    ),
                  ),
                )
              ],
            ),
          ),
          IconButton(
            onPressed: callback,
            icon: Icon(
              Icons.keyboard_arrow_right,
              size: 35,
              color: BasicColor.primary,
            ),
          )
        ],
      ),
    );
  }
}
