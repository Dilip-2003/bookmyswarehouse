import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchFieldHome extends StatelessWidget {
  const SearchFieldHome(
      {super.key,
      required this.colors,
      required this.hintText,
      required this.prefixIcon,
      required this.suffixIcon});
  final Icon prefixIcon;
  final String suffixIcon;
  final String hintText;
  final Color colors;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var searchController = TextEditingController();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(81),
        color: colors,
      ),
      height: height * 0.06,
      width: width * 0.9,
      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: TextField(
        controller: searchController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                print('filter button pressed');
              },
              icon: Image.asset(
                suffixIcon,
                height: 22,
                width: 22,
                fit: BoxFit.cover,
              ),
            ),
          ),
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            textStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.02,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(81),
          ),
        ),
      ),
    );
  }
}
