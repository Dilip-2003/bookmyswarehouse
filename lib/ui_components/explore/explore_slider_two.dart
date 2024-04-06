import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/widgets/propert_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreSliderTwo extends StatefulWidget {
  const ExploreSliderTwo({
    super.key,
    required this.title,
    required this.subTitle2,
  });
  final String title, subTitle2;

  @override
  State<ExploreSliderTwo> createState() => _ExploreSliderTwoState();
}

class _ExploreSliderTwoState extends State<ExploreSliderTwo> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.36,
      width: width,
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: width * 0.02,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width * 0.7,
                  height: height * 0.06,
                  child: Text(
                    widget.title,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 18,
                          letterSpacing: 0.13,
                          color: BasicColor.deepBlack,
                          fontWeight: FontWeight.w800),
                    ),
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
          ),
          Container(
            width: width,
            height: height * 0.28,
            margin: EdgeInsets.only(top: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProperDetailsScreen(),
                        ));
                    print('property details clicked');
                  },
                  child: SizedBox(
                    width: width * 0.5,
                    height: height * 0.15,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(
                            'assets/images/Frame 7.png',
                            height: height * 0.23,
                            width: width * 0.46,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: width * 0.02),
                              height: height * 0.03,
                              width: width * 0.5,
                              child: Text(
                                'Delhi ',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  fontSize: 16,
                                  color: BasicColor.lightBlack,
                                  fontWeight: FontWeight.w800,
                                )),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: width * 0.02),
                              height: height * 0.02,
                              width: width * 0.5,
                              child: Text(
                                widget.subTitle2,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF7D7F88),
                                )),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
