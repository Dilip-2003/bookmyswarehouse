import 'package:bookmywarehouse/ui_components/profile/section_one.dart';
import 'package:bookmywarehouse/ui_components/profile/section_two.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Container(
      height: height,
      margin: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: const Column(
        children: [
          ProfileSectionOne(),
          Divider(
            height: 1,
          ),
          ProfileSectionTwo(),
        ],
      ),
    );
  }
}
