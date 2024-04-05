import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/property_details/heading.dart';
import 'package:bookmywarehouse/ui_components/property_details/readmore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestiMonials extends StatefulWidget {
  const TestiMonials({super.key});

  @override
  State<TestiMonials> createState() => _TestiMonialsState();
}

class _TestiMonialsState extends State<TestiMonials> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Heading(title: 'Testimonials'),
        const Reviewer(),
        ReadMorePage(),
        const Reviewer(),
        ReadMorePage(),
        const Reviewer(),
        ReadMorePage(),
        const Reviewer(),
        ReadMorePage(),
        const Reviewer(),
        ReadMorePage(),
        const Reviewer(),
        ReadMorePage(),
      ],
    );
  }
}

class Reviewer extends StatelessWidget {
  const Reviewer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width * 0.9,
      height: height * 0.08,
      child: Row(
        children: [
          ClipRRect(
            child: Image.asset(
              'assets/images/owner_img.png',
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                Text(
                  'Sans Damns',
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 18, color: BasicColor.deepBlack)),
                ),
                const Text(
                  '  ⭐ ⭐ ⭐ ⭐ ⭐',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
