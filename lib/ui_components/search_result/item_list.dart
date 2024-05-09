import 'package:bookmywarehouse/data/datalist.dart';
import 'package:bookmywarehouse/ui_components/saved_page/favouriteitem.dart';
import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  const ItemList({super.key});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  List<Map<String, dynamic>> houseList = WareHouseList.warehouseList;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
      height: height,
      child: ListView.builder(
        itemCount: houseList.length,
        itemBuilder: (context, index) {
          final warehouse = houseList[index];
          return PropertyCard(
            warehouse: warehouse,
          );
        },
      ),
    );
  }
}
