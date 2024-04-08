import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/search_result/appbar.dart';
import 'package:bookmywarehouse/ui_components/search_result/pricebox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 40,
          ),
        ),
        automaticallyImplyLeading: false,
        title: CustomAppBarSearchResults(),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/map.png',
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),
          const Positioned(
            top: 200,
            left: 50,
            child: PriceBox(
              title: 'Rs. 54125',
            ),
          ),
          const Positioned(
            top: 100,
            child: PriceBox(
              title: 'Rs. 54125',
            ),
          ),
          const Positioned(
            top: 120,
            left: 120,
            child: PriceBox(
              title: 'Rs. 54125',
            ),
          ),
          const Positioned(
            top: 50,
            right: 50,
            child: PriceBox(
              title: 'Rs. 54125',
            ),
          ),
          const Positioned(
            top: 150,
            right: 20,
            child: PriceBox(
              title: 'Rs. 54125',
            ),
          ),
          const Positioned(
            top: 200,
            right: 30,
            child: PriceBox(
              title: 'Rs. 54125',
            ),
          ),
          const Positioned(
            top: 40,
            right: 170,
            child: PriceBox(
              title: 'Rs. 54125',
            ),
          ),
          const Positioned(
            top: 10,
            left: 20,
            child: PriceBox(
              title: 'Rs. 54125',
            ),
          ),
          Positioned(
            top: height * 0.25,
            child: Container(
              height: height * 0.65,
              width: width,
              decoration: BoxDecoration(
                  color: BasicColor.lightWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: ItemList(),
            ),
          )
        ],
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  @override
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
          margin: EdgeInsets.only(
            top: 20,
          ),
          height: height * 0.05,
          width: width * 0.9,
          color: BasicColor.deepWhite,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: ListView.builder(
              itemCount: _visibleItemCount,
              itemBuilder: (context, index) {
                return Container(
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
                                      fontSize: 14, color: Color(0xFF7D7F88))),
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
                                  padding: EdgeInsets.only(left: width * 0.08),
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
                );
              },
            ),
          ),
        ),
        Visibility(
          visible: _visibleItemCount < items.length,
          child: Container(
            height: height * 0.1,
            width: width,
            color: Colors.blue,
            child: InkWell(
              onTap: _showMoreItems,
              child: Center(
                child: Text(
                  'More',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.02,
                      color: BasicColor.deepBlack,
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
