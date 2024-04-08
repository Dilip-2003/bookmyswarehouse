import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBarSearchResults extends StatelessWidget {
  const CustomAppBarSearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    final fileterSearchController = TextEditingController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: width * 0.12,
          width: width * 0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(81),
            color: const Color(0xFFE3E3E7),
          ),
          child: TextField(
            controller: fileterSearchController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Noida, NCR',
              hintStyle: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.02,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(81),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFE3E3E7),
            borderRadius: BorderRadius.circular(15),
          ),
          child: SvgPicture.asset(
            'assets/images/filter.svg',
            height: width * 0.07,
            width: width * 0.07,
            fit: BoxFit.cover,
            // ignore: deprecated_member_use
            color: BasicColor.lightBlack,
          ),
        )
      ],
    );
  }
}
