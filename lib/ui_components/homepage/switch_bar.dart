import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchBarHome extends StatefulWidget {
  SwitchBarHome({Key? key}) : super(key: key);

  @override
  State<SwitchBarHome> createState() => _SwitchBarHomeState();
}

class _SwitchBarHomeState extends State<SwitchBarHome> {
  bool isToggle1 = false;
  bool isToggle2 = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color(0xFFE3E3E7),
      ),
      height: height * 0.07,
      width: width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isToggle1 = true;
                isToggle2 = false;
              });
            },
            child: Container(
              width: width * 0.4,
              height: height * 0.05,
              decoration: BoxDecoration(
                color: isToggle1 ? BasicColor.primary : Color(0xFFE3E3E7),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                  child: Text(
                'I need to rent',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 15,
                    letterSpacing: 0.13,
                    color: isToggle1 ? Color(0xFFFFFFFF) : Color(0xFF7D7F88),
                  ),
                ),
              )),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isToggle1 = false;
                isToggle2 = true;
              });
            },
            child: Container(
              width: width * 0.4,
              height: height * 0.05,
              decoration: BoxDecoration(
                color: isToggle2 ? BasicColor.primary : Color(0xFFE3E3E7),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  'I want to lease',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 15,
                        letterSpacing: 0.13,
                        color:
                            isToggle2 ? Color(0xFFFFFFFF) : Color(0xFF7D7F88)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
