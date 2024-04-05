import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RentButton extends StatelessWidget {
  const RentButton({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height * 0.07,
      width: width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Rs.90,500 ',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: BasicColor.deepBlack)),
                  ),
                  Text(
                    '/ month',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF7D7F88),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                'Payment Estimations',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 12,
                      color: BasicColor.lightBlack,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          InkWell(
            onTap: () {
              print('rent button clicked');
            },
            child: Container(
              width: width * 0.35,
              height: height * 0.06,
              decoration: BoxDecoration(
                  color: BasicColor.primary,
                  borderRadius: BorderRadius.circular(75)),
              child: Center(
                child: Text(
                  'Rent',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: BasicColor.deepWhite,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
