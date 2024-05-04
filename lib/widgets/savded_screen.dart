import 'package:bookmywarehouse/ui_components/saved_page/favouriteitem.dart';
import 'package:bookmywarehouse/ui_components/saved_page/saved_appbar.dart';
import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const SavedAppBar(
          icons: Icon(
            Icons.search,
            size: 30,
          ),
          emailText: 'Search Saved Properites',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.02),
        child: SavedItem(),
      ),
    );
  }
}
