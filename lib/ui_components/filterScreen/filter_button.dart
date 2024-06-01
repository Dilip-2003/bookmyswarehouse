import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({super.key, required this.callback});
  final VoidCallback callback;

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.1,
      width: width * 0.9,
      color: BasicColor.deepWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: SizedBox(
              width: width * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.refresh_outlined,
                    size: 20,
                  ),
                  Text(
                    'Reset All',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        letterSpacing: 0.02,
                        color: Color(0xFF7D7F88),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: widget.callback,
            child: Container(
              height: height * 0.05,
              width: width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: BasicColor.deepBlack,
              ),
              child: Center(
                child: Text(
                  'Show Results',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 16,
                        letterSpacing: 0.02,
                        color: BasicColor.deepWhite),
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
