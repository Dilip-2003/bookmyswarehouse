import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProDetailsSlider extends StatefulWidget {
  const ProDetailsSlider({super.key});

  @override
  State<ProDetailsSlider> createState() => _ProDetailsSliderState();
}

class _ProDetailsSliderState extends State<ProDetailsSlider> {
  List<dynamic> imgList = [
    'assets/images/Frame 7.png',
    'assets/images/Frame 7.png',
    'assets/images/Frame 7.png',
    'assets/images/Frame 7.png',
    'assets/images/Frame 7.png',
    'assets/images/Frame 7.png',
    'assets/images/Frame 7.png',
    'assets/images/Frame 7.png',
    'assets/images/Frame 7.png',
    'assets/images/Frame 7.png',
    'assets/images/Frame 7.png',
    'assets/images/Frame 7.png',
    'assets/images/Frame 7.png',
    'assets/images/Frame 7.png',
    'assets/images/Frame 7.png',
    'assets/images/Frame 7.png',
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        CarouselSlider(
            carouselController: carouselController,
            items: imgList
                .map((img) => Image.asset(
                      img,
                      fit: BoxFit.cover,
                      width: width,
                    ))
                .toList(),
            options: CarouselOptions(
              scrollPhysics: BouncingScrollPhysics(),
              // autoPlay: true,
              aspectRatio: 2,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            )),
        Positioned(
          top: height * 0.04,
          left: height * 0.01,
          right: height * 0.01,
          child: SizedBox(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: width * 0.12,
                    width: width * 0.12,
                    decoration: BoxDecoration(
                      color: BasicColor.deepWhite,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      size: width * 0.1,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: width * 0.12,
                    width: width * 0.12,
                    margin: EdgeInsets.only(left: width * 0.6),
                    decoration: BoxDecoration(
                      color: BasicColor.deepWhite,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.share,
                      size: width * 0.07,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: Container(
            height: 35,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: BasicColor.deepWhite,
            ),
            child: Center(
              child: Text(
                '${currentIndex + 1}/${imgList.length}',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 18,
                    color: BasicColor.lightBlack,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
