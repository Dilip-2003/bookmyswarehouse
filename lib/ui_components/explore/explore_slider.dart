import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/widgets/propert_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreSlider extends StatefulWidget {
  const ExploreSlider({
    super.key,
    required this.title,
    required this.city,
  });
  final String title, city;

  @override
  State<ExploreSlider> createState() => _ExploreSliderState();
}

class _ExploreSliderState extends State<ExploreSlider> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.36,
      width: width,
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.02,
              vertical: width * 0.02,
            ),
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
          SizedBox(
            width: width,
            height: height * 0.28,
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
                              margin: EdgeInsets.only(
                                left: width * 0.15,
                                top: width * 0.02,
                              ),
                              height: height * 0.03,
                              width: width * 0.5,
                              child: Text(
                                widget.city,
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  fontSize: 16,
                                  color: BasicColor.lightBlack,
                                  fontWeight: FontWeight.w800,
                                )),
                              ),
                            ),
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
