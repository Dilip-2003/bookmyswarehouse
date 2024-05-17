import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/data/datalist.dart';
import 'package:bookmywarehouse/src/getx/favourite_controller.dart';
import 'package:bookmywarehouse/src/warehouse/pages/propert_details.dart';
import 'package:bookmywarehouse/widgets/favourite_screen.dart';
import 'package:bookmywarehouse/widgets/savded_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final FavoriteController favoriteController = Get.put(FavoriteController());
  List<Map<String, dynamic>> houseList = WareHouseList.warehouseList;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var length = houseList.length;

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
                    widget.subTitle == ''
                        ? Text(
                            widget.subTitle,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                              fontSize: 13,
                              letterSpacing: 0.13,
                              color: Color(0xFF7D7F88),
                            )),
                          )
                        : Text(
                            '$length ${widget.subTitle}',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 13,
                                letterSpacing: 0.13,
                                color: Color(0xFF7D7F88),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => SavedScreen());
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
              itemCount: houseList.length,
              itemBuilder: (context, index) {
                final wareHouse = houseList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProperDetailsScreen(
                          warehouse: wareHouse,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    width: width * 0.86,
                    height: height * 0.15,
                    child: Stack(
                      children: [
                        Container(
                          color: Colors.white54,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                child: Image.asset(
                                  wareHouse['image'],
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                          wareHouse['stars'],
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontSize: 12,
                                                  color:
                                                      BasicColor.lightBlack)),
                                        ),
                                        Text(
                                          ' (${wareHouse['reviewers']})',
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFF7D7F88))),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: width * 0.5,
                                      child: Text(
                                        wareHouse['title'],
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 16,
                                                letterSpacing: 0.13,
                                                color: BasicColor.deepBlack,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ),
                                    Text(
                                      wareHouse['address'],
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
                                          '${wareHouse['area']} Sq. Metre',
                                          style: GoogleFonts.poppins(
                                              textStyle: const TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFF7D7F88))),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Rs.${wareHouse['rent']}',
                                              style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        BasicColor.lightBlack),
                                              ),
                                            ),
                                            Text('/day',
                                                style: GoogleFonts.poppins(
                                                  textStyle: const TextStyle(
                                                    fontSize: 14,
                                                    color: Color(0xFF7D7F88),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Obx(() {
                            bool isFav =
                                favoriteController.isFavorite(wareHouse);
                            return IconButton(
                              onPressed: () {
                                if (isFav) {
                                  favoriteController.removeFavorite(wareHouse);
                                } else {
                                  favoriteController.addFavorite(wareHouse);
                                }
                              },
                              icon: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                size: 25,
                                color: isFav
                                    ? BasicColor.primary
                                    : Color(0xFF7D7F88),
                              ),
                            );
                          }),
                        ),
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
