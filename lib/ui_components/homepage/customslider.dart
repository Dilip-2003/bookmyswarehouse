import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/saved_page/favouriteitem.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSliderHome extends StatefulWidget {
  const CustomSliderHome(
      {super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  State<CustomSliderHome> createState() => _CustomSliderHomeState();
}

class _CustomSliderHomeState extends State<CustomSliderHome> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    print(isFav);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.28,
      width: width,
      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 18,
                          letterSpacing: 0.13,
                          color: BasicColor.deepBlack,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Text(
                      widget.subTitle,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                        fontSize: 13,
                        letterSpacing: 0.13,
                        color: Color(0xFF7D7F88),
                      )),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  print('see all clicked');
                },
                child: const Text('See all'),
              )
            ],
          ),
          SizedBox(
            width: width,
            height: height * 0.22,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return PropertyCard();
              },
            ),
          )
        ],
      ),
    );
  }
}
