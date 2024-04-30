import 'package:bookmywarehouse/ui_components/search_result/appbar.dart';
import 'package:bookmywarehouse/ui_components/search_result/item_list.dart';
import 'package:bookmywarehouse/ui_components/search_result/pricebox.dart';
import 'package:flutter/material.dart';

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
        title: const CustomAppBarSearchResults(),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/map.png',
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  top: 60,
                  left: 30,
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
                  top: 100,
                  left: 100,
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
                  top: 100,
                  right: 20,
                  child: PriceBox(
                    title: 'Rs. 54125',
                  ),
                ),
                const Positioned(
                  top: 120,
                  right: 100,
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
              ],
            ),
            ItemList(),
          ],
        ),
      ),
    );
  }
}
