import 'package:flutter/material.dart';

class MapPropertDetails extends StatelessWidget {
  const MapPropertDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/images/map.png',
              height: width * 0.6,
              width: width * 0.9,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,

            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/Vector.png',
                height: 35,
                width: 35,
              ),
            ),
            // child: Container(
            //     height: width * 0.1,
            //     width: width * 0.1,
            //     decoration: BoxDecoration(
            //         color: BasicColor.lightBlack,
            //         borderRadius: BorderRadius.circular(5)),
            //     child: Icon(
            //       Icons.expand,
            //       color: BasicColor.lightWhite,
            //     )),
          ),
        ],
      ),
    );
  }
}
