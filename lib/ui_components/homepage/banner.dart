import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerHome extends StatelessWidget {
  const BannerHome({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Container(
      height: height * 0.3,
      width: width * 0.9,
      margin: EdgeInsets.only(left: width * 0.05, bottom: width * 0.02),
      child: Row(
        children: [
          Container(
            width: width * 0.55,
            height: height * 0.3,
            decoration: BoxDecoration(
              color: BasicColor.primary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, top: 15, bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.45,
                    child: Text(
                      'Want to host your own place?',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: BasicColor.deepWhite,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Earn passive income by renting or selling your properties!',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFE3DDFF),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: width * 0.14,
                    width: width * 0.4,
                    decoration: BoxDecoration(
                      color: BasicColor.deepWhite,
                      borderRadius: BorderRadius.circular(75),
                    ),
                    child: Center(
                      child: Text(
                        'Become a host',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: BasicColor.primary,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15)),
            child: Image.asset(
              'assets/images/house.png',
              width: width * 0.35,
              height: height * 0.3,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
