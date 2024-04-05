import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/widgets/propert_details.dart';
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
  @override
  Widget build(BuildContext context) {
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
                              fontWeight: FontWeight.w800)),
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
            height: height * 0.205,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    print('property details clicked');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProperDetailsScreen(),
                        ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    width: width * 0.86,
                    height: height * 0.15,
                    child: Container(
                      color: Colors.white54,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            child: Image.asset(
                              'assets/images/Frame 7.png',
                              height: height * 0.22,
                              width: width * 0.33,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: width * 0.53,
                            padding: EdgeInsets.only(left: width * 0.02),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white24,
                                    blurRadius: 5.0,
                                    spreadRadius: 5.0,
                                    offset: Offset(4, 1),
                                  )
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      ' ⭐ ',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              color: BasicColor.secondary)),
                                    ),
                                    Text(
                                      '4.8 ',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              color: BasicColor.lightBlack)),
                                    ),
                                    Text(
                                      '(73) ',
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF7D7F88))),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: width * 0.5,
                                  // height: height * 0.05,
                                  child: Text(
                                    'Warehouse in Ghaziabad',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 16,
                                            letterSpacing: 0.13,
                                            color: BasicColor.deepBlack,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                                Text(
                                  'Ghaziabad, NCR',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF7D7F88))),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.house_rounded,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      '988 m2',
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF7D7F88))),
                                    ),
                                  ],
                                ),
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Rs.95,000',
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      BasicColor.lightBlack)),
                                        ),
                                        Text(
                                          '/ month',
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFF7D7F88))),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.08),
                                      child: Icon(
                                        Icons.favorite_border,
                                        size: 22,
                                        color: Color(0xFF7D7F88),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
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
