import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSectionTwo extends StatelessWidget {
  const ProfileSectionTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height * 0.5,
      width: width * 0.9,
      child: Padding(
        padding: EdgeInsets.only(top: height * 0.05),
        child: Column(
          children: [
            const SectionTwo(
              icons: Icon(Icons.person),
              title: 'Personal details',
            ),
            SizedBox(
              height: height * 0.035,
            ),
            const SectionTwo(
              icons: Icon(Icons.settings),
              title: 'Settings',
            ),
            SizedBox(
              height: height * 0.035,
            ),
            const SectionTwo(
              icons: Icon(Icons.credit_card),
              title: 'Payment details',
            ),
            SizedBox(
              height: height * 0.035,
            ),
            const SectionTwo(
              icons: Icon(Icons.message_rounded),
              title: 'FAQ',
            ),
            SizedBox(
              height: height * 0.035,
            ),
            const Divider(
              height: 1,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            const SectionTwo(
              icons: Icon(Icons.toggle_off),
              title: 'Switch to hosting',
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTwo extends StatelessWidget {
  const SectionTwo({super.key, required this.icons, required this.title});
  final Icon icons;
  final String title;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return Row(
      children: [
        Container(
          height: width * 0.1,
          width: width * 0.1,
          decoration: BoxDecoration(
            color: BasicColor.deepWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: icons,
        ),
        Container(
          margin: EdgeInsets.only(left: width * 0.04),
          width: width * 0.76,
          height: width * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 20,
                    letterSpacing: 0.13,
                    color: BasicColor.lightBlack,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print('profile settings button pressed');
                },
                child: const Icon(
                  Icons.keyboard_arrow_right,
                  size: 35,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
