import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HouseDetails extends StatelessWidget {
  HouseDetails({super.key, required this.warehouse});
  final Map<String, dynamic> warehouse;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.25,
      width: width * 0.9,
      decoration: BoxDecoration(
          color: BasicColor.deepWhite, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            child: Image.asset(
              warehouse['image'],
              height: height * 0.25,
              width: width * 0.35,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: width * 0.03, top: width * 0.05, bottom: width * 0.03),
            height: height * 0.25,
            width: width * 0.52,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      ' ⭐ ',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14, color: BasicColor.secondary)),
                    ),
                    Text(
                      warehouse['stars'],
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14, color: BasicColor.lightBlack)),
                    ),
                    Text(
                      '(${warehouse['reviewers']}) ',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 14, color: Color(0xFF7D7F88))),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.5,
                      child: Text(
                        warehouse['title'],
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20,
                                letterSpacing: 0.13,
                                color: BasicColor.deepBlack,
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Text(
                      warehouse['address'],
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 16, color: Color(0xFF7D7F88))),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Rs.${warehouse['rent']}',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 18,
                            color: BasicColor.deepBlack,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Text(
                      '/ day',
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF7D7F88),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
