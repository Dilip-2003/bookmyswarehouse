import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WareHouseDetais extends StatefulWidget {
  WareHouseDetais({
    super.key,
    required this.stars,
    required this.reviewers,
    required this.address,
    required this.area,
    required this.title,
  });
  final String stars, reviewers, area, address, title;
  @override
  State<WareHouseDetais> createState() => _WareHouseDetaisState();
}

class _WareHouseDetaisState extends State<WareHouseDetais> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.06),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                // height: height * 0.08,
                width: width * 0.6,
                child: Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: BasicColor.deepBlack)),
                ),
              ),
              IconButton(
                onPressed: () {
                  print('favourite button clicked');
                },
                icon: Icon(
                  Icons.favorite_border,
                  color: BasicColor.lightBlack,
                  size: width * 0.08,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        ' ⭐ ',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 12, color: BasicColor.secondary)),
                      ),
                      Text(
                        widget.stars,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 12, color: BasicColor.lightBlack)),
                      ),
                      Text(
                        '  (${widget.reviewers} reviews) ',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 12, color: Color(0xFF7D7F88))),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Color(0xFF7D7F88),
                        size: 20,
                      ),
                      Text(
                        widget.address,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 12, color: Color(0xFF7D7F88))),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.bed,
                        color: const Color(0xFF7D7F88),
                        size: width * 0.05,
                      ),
                      Text(
                        '   2 Room',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 12, color: Color(0xFF7D7F88))),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.house_siding_rounded,
                        color: const Color(0xFF7D7F88),
                        size: width * 0.05,
                      ),
                      Text(
                        '${widget.area} sq. metre',
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 12, color: Color(0xFF7D7F88))),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
