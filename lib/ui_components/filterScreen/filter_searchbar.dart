import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterSearchBar extends StatelessWidget {
  FilterSearchBar({
    super.key,
    required this.text,
  });
  String text;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    final fileterSearchController = TextEditingController();
    return Padding(
      padding: EdgeInsets.only(top: width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.keyboard_arrow_left,
              size: 30,
            ),
          ),
          Container(
            height: height * 0.062,
            width: width * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(81),
              color: const Color(0xFFE3E3E7),
            ),
            child: TextField(
              controller: fileterSearchController,
              keyboardType: TextInputType.text,
              readOnly: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: text,
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
              color: BasicColor.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SvgPicture.asset(
              'assets/images/filter.svg',
              height: width * 0.07,
              width: width * 0.07,
              fit: BoxFit.cover,
              // ignore: deprecated_member_use
              color: BasicColor.deepWhite,
            ),
          )
        ],
      ),
    );
  }
}
