import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/data/datalist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreSlider extends StatefulWidget {
  const ExploreSlider({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<ExploreSlider> createState() => _ExploreSliderState();
}

class _ExploreSliderState extends State<ExploreSlider> {
  List<Map<String, dynamic>> houseList = WareHouseList.warehouseList;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height * 0.42,
      // width: width,
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.02,
            ),
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
            height: height * 0.36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: houseList.length,
              itemBuilder: (context, index) {
                final wareHouse = houseList[index];

                return InkWell(
                  onTap: () {
                    Get.defaultDialog(
                      title: "Under Process",
                      middleText: "This page is under process",
                      textConfirm: "OK",
                      confirmTextColor: Colors.white,
                      onConfirm: () {
                        Get.back();
                      },
                    );
                    print('Living Styles clicked');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: BasicColor.deepWhite,
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: width * 0.02),
                    width: width * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.asset(
                            wareHouse['living']['image'],
                            height: height * 0.29,
                            width: width * 0.6,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.05,
                          width: width * 0.5,
                          child: Center(
                            child: Text(
                              wareHouse['living']['title'],
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                fontSize: 16,
                                color: BasicColor.lightBlack,
                                fontWeight: FontWeight.w700,
                              )),
                            ),
                          ),
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
