import 'package:bookmywarehouse/ui_components/search_result/appbar.dart';
import 'package:bookmywarehouse/ui_components/search_result/item_list.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
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
      body: ItemList(),
    );
  }
}
