import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WareHouseFacility extends StatelessWidget {
  const WareHouseFacility({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Warehouse facilities',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                        color: BasicColor.deepBlack)),
              ),
              TextButton(
                  onPressed: () {
                    print('text button pressed');
                  },
                  child: Text(
                    'See all facilities',
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontSize: 14, color: BasicColor.primary)),
                  ))
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.kitchen_rounded,
                size: 25,
                color: Color(0xFF7D7F88),
              ),
              Text(
                '  Kitchen',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF7D7F88),
                )),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.directions_car_filled_rounded,
                size: 25,
                color: Color(0xFF7D7F88),
              ),
              Text(
                '  Parking',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF7D7F88),
                )),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.wifi_rounded,
                size: 25,
                color: Color(0xFF7D7F88),
              ),
              Text(
                '  Free WiFi',
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF7D7F88),
                )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
