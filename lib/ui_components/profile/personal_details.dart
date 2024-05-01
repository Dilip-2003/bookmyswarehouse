import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/profile/appbar.dart';
import 'package:bookmywarehouse/ui_components/profile/edit_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        title: const ProfileAppBar(
          text: 'Personal Details',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.2,
                width: width * 0.9,
                child: Center(
                  child: UserProfileAvatar(
                    avatarUrl: '',
                    radius: 50,
                  ),
                ),
              ),
              const PersonContacts(),
              SizedBox(
                height: height * 0.01,
              ),
              const BusinessDetails(),
              SizedBox(
                height: height * 0.01,
              ),
              const SectionFour(),
              SizedBox(
                height: height * 0.01,
              ),
              const LogOutButton(),
              SizedBox(
                height: height * 0.01,
              ),
              const DeleteButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: () {
        if (kDebugMode) {
          print('delete button pressed');
        }
      },
      child: Container(
        height: height * 0.08,
        width: width * 0.9,
        padding: EdgeInsets.only(left: width * 0.05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: BasicColor.deepWhite,
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_outline_outlined,
                color: Colors.red,
                size: 30,
              ),
            ),
            Text(
              'Delete Account',
              style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: () {
        if (kDebugMode) {
          print('logout buttton pressed');
        }
      },
      child: Container(
        height: height * 0.08,
        width: width * 0.9,
        padding: EdgeInsets.only(left: width * 0.05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: BasicColor.deepWhite,
        ),
        child: Row(
          children: [
            SizedBox(
              width: width * 0.1,
              child: const Icon(
                Icons.logout,
                size: 30,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: width * 0.03),
              width: width * 0.73,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Logout',
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      color: Color(0xFF444444),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                      size: 30,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SectionFour extends StatelessWidget {
  const SectionFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCard(
          icons: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.help_outline,
              size: 28,
            ),
          ),
          text: 'Help',
        ),
        CustomCard(
          icons: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfile(),
                  ));
            },
            icon: const Icon(
              Icons.edit_sharp,
              size: 20,
            ),
          ),
          text: 'Edit Profile',
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard({super.key, required this.icons, required this.text});
  IconButton icons;
  final String text;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.08,
      width: width * 0.43,
      padding: EdgeInsets.only(left: width * 0.05),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: BasicColor.deepWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          icons,
          Text(
            text,
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
              color: Color(0xFF444444),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            )),
          )
        ],
      ),
    );
  }
}

class BusinessDetails extends StatelessWidget {
  const BusinessDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.3,
      width: width * 0.9,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: BasicColor.deepWhite,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextBox(
            text1: 'Business/Restaurant Name1',
            text2: 'ABC XYZ Restaurant',
          ),
          TextBox(
            text1: 'Address',
            text2: '111, ABC Apartments, XYZ Road,New Delhi, Delhi',
          ),
          TextBox(
            text1: 'Services',
            text2:
                'Chef Service (One Time, Occasion)Add Ons (Bartenders, Waiters) Tiffin Services Homemaker Services',
          ),
        ],
      ),
    );
  }
}

class TextBox extends StatelessWidget {
  const TextBox({super.key, required this.text1, required this.text2});
  final String text1, text2;

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text1,
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
              color: Color(0xFF444444),
              fontSize: 10,
              fontWeight: FontWeight.w400,
            )),
          ),
          Text(
            text2,
            style: GoogleFonts.lato(
                textStyle: const TextStyle(
              color: Color(0xFF444444),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            )),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}

class PersonContacts extends StatelessWidget {
  const PersonContacts({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.09,
      width: width * 0.9,
      padding: EdgeInsets.all(width * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: BasicColor.deepWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi, Dilip Sarkar',
            style: GoogleFonts.inter(
                textStyle: const TextStyle(
              color: Color(0xFF222222),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.call,
                size: 16,
                color: Colors.grey,
              ),
              Text(
                ' +919064364294',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(color: Colors.grey),
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
