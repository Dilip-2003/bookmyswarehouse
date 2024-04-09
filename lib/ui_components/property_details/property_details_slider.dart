import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProDetailsSlider extends StatelessWidget {
  const ProDetailsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        Image.asset(
          'assets/images/picture+buttons.png',
          width: width,
          height: height * 0.3,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: height * 0.05,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: width * 0.15,
                  width: width * 0.15,
                  margin: EdgeInsets.only(left: width * 0.05),
                  decoration: BoxDecoration(
                    color: BasicColor.deepWhite,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    size: width * 0.1,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: width * 0.15,
                  width: width * 0.15,
                  margin: EdgeInsets.only(left: width * 0.6),
                  decoration: BoxDecoration(
                    color: BasicColor.deepWhite,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.share,
                    size: width * 0.07,
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: Container(
            height: 35,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: BasicColor.deepWhite,
            ),
            child: Center(
              child: Text(
                '1/11',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: BasicColor.lightBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
