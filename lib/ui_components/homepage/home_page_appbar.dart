import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageNavbar extends StatelessWidget {
  const HomePageNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10.0),
          child: Text(
            'Find your place in',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xFF7D7F88),
                letterSpacing: 0.15,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.location_on,
              color: BasicColor.primary,
              size: 20,
            ),
            Text(
              ' Mumbai,India',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 20,
                    color: BasicColor.deepBlack,
                    fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: BasicColor.deepBlack,
                fill: 0.6,
              ),
            ),
          ],
        )
      ],
    );
  }
}
