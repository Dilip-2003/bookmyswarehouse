import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/saved_page/favouriteitem.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return PropertyCard();
        },
      ),
    );
  }
}
