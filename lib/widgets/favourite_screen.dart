import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/src/getx/favourite_controller.dart';
import 'package:bookmywarehouse/src/warehouse/pages/propert_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final FavoriteController favoriteController = Get.find<FavoriteController>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Items'),
      ),
      body: Obx(() {
        if (favoriteController.favoriteItems.isEmpty) {
          return const Center(
            child: Text('No favorite items yet.'),
          );
        }
        return ListView.builder(
          itemCount: favoriteController.favoriteItems.length,
          itemBuilder: (context, index) {
            final wareHouse = favoriteController.favoriteItems[index];
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
                margin: EdgeInsets.only(
                  top: height * 0.01,
                  left: width * 0.05,
                  right: width * 0.05,
                ),
                width: width * 0.86,
                height: height * 0.2,
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
                                      wareHouse['stars'],
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              color: BasicColor.lightBlack)),
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
                                                color: BasicColor.lightBlack),
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
                        // favoriteController.isFavourite =
                        //     !favoriteController.isFavourite;
                        bool isFav = favoriteController.isFavorite(wareHouse);
                        return IconButton(
                          onPressed: () {
                            favoriteController.removeFavorite(wareHouse);
                          },
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            size: 25,
                            color:
                                isFav ? BasicColor.primary : Color(0xFF7D7F88),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
