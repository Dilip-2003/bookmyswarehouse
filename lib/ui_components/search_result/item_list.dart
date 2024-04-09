import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/widgets/propert_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  int _visibleItemCount = 3;
  List<String> items = List.generate(10, (index) => "Item ${index + 1}");

  void _showMoreItems() {
    print('show more called');
    setState(() {
      _visibleItemCount = (_visibleItemCount + 3 <= items.length)
          ? _visibleItemCount + 3
          : items.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 20,
          ),
          height: height * 0.05,
          width: width * 0.9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Showing 72 Results',
                style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 18, color: BasicColor.lightBlack)),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        print('sort button clicked');
                      },
                      icon: const Icon(
                        Icons.sort,
                        size: 30,
                      )),
                  Text(
                    'Sort',
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 16, color: BasicColor.lightBlack),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: ListView.builder(
              itemCount: _visibleItemCount,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProperDetailsScreen(),
                      )),
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: width * 0.9,
                    height: height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white54,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          child: Image.asset(
                            'assets/images/Frame 7.png',
                            height: height * 0.22,
                            width: width * 0.35,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: width * 0.55,
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
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'Rs.95,000',
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 14,
                                              color: BasicColor.lightBlack),
                                        ),
                                      ),
                                      Text(
                                        '/ month',
                                        style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF7D7F88),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: width * 0.08),
                                    child: const Icon(
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
                );
              },
            ),
          ),
        ),
        Visibility(
          visible: _visibleItemCount < items.length,
          child: Container(
            height: height * 0.06,
            margin: EdgeInsets.only(
              bottom: 15,
              top: 10,
              right: width * 0.05,
              left: width * 0.05,
            ),
            width: width,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                border: Border.all(color: BasicColor.primary, width: 1.5)),
            child: InkWell(
              onTap: _showMoreItems,
              child: Center(
                child: Text(
                  'Show more results',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.02,
                      color: BasicColor.primary,
                    ),
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
