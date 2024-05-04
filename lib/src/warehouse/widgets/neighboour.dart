import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/src/warehouse/widgets/heading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NeighBour extends StatelessWidget {
  const NeighBour({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return SizedBox(
      height: height * 0.36,
      width: width * 0.9,
      child: Column(
        children: [
          Heading(title: 'About locations neighborhood'),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
            style: GoogleFonts.poppins(
                textStyle:
                    const TextStyle(fontSize: 14, color: Color(0xFF7D7F88))),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: height * 0.07,
            width: width * .9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                border: Border.all(color: const Color(0xFF7D7F88), width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Average maintenance cost',
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 12, color: Color(0xFF7D7F88))),
                ),
                Text(
                  'Rs.12500/month',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 12,
                          color: BasicColor.deepBlack,
                          fontWeight: FontWeight.w700)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
