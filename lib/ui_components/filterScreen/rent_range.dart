import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/filterScreen/header.dart';
import 'package:bookmywarehouse/ui_components/filterScreen/property_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceRange extends StatefulWidget {
  const PriceRange({super.key});

  @override
  State<PriceRange> createState() => _PriceRangeState();
}

class _PriceRangeState extends State<PriceRange> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return Container(
      width: width * 0.9,
      height: height * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(
            title: 'Price Range',
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Rs.23000 - Rs. 4,00,000+ / month',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 16,
                letterSpacing: 0.02,
                color: BasicColor.deepBlack,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SvgPicture.asset(
            'assets/images/graph.svg',
            height: width * 0.25,
            width: width * 0.9,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10,
          ),
          PropertyType(),
        ],
      ),
    );
  }
}
