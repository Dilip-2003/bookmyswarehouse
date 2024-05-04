import 'package:bookmywarehouse/ui_components/search_result/appbar.dart';
import 'package:bookmywarehouse/ui_components/search_result/item_list.dart';
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
        child: Column(
          children: [
            Image.asset(
              'assets/images/map.png',
              height: height * 0.8,
              width: width,
              fit: BoxFit.cover,
            ),
            ItemList(),
          ],
        ),
      ),
    );
  }
}
