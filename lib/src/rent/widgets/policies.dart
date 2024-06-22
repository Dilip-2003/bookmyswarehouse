import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/profile/privacy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Policy extends StatelessWidget {
  const Policy({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * .12,
      width: width * .9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFFDFDFD)),
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: width * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.gavel_rounded,
            size: 30,
            color: BasicColor.primary,
          ),
          SizedBox(
            width: width * 0.68,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height * 0.07,
                  width: width * 0.55,
                  child: Text(
                    'Read other policies',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 22,
                        color: BasicColor.deepBlack,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 0.02,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(PrivacyAndPolicy());
                    print('Circular add pressed');
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
