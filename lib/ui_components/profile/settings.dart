import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/profile/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const ProfileAppBar(
          text: 'Settings',
        ),
      ),
      backgroundColor: const Color(0xFFF3F3F3),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              Container(
                height: height * 0.25,
                width: width * 0.9,
                margin: EdgeInsets.only(top: height * 0.02),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: BasicColor.deepWhite,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UserProfileAvatar(
                      avatarUrl: '',
                      radius: 40,
                    ),
                    Text(
                      'Dilip Sarkar',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: BasicColor.deepBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SettingCard(
                color: BasicColor.deepBlack,
                isSubtile: true,
                callback: () {
                  print('notifications screen open');
                },
                title: 'Notifications',
                icon: const Icon(
                  Icons.notifications_active,
                  size: 30,
                ),
                subtile: 'Message, group & call tones',
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SettingCard(
                color: BasicColor.deepBlack,
                callback: () {
                  print('help screen open');
                },
                isSubtile: true,
                title: 'Help',
                icon: const Icon(
                  Icons.headset_mic,
                  size: 30,
                ),
                subtile: 'Help cenre, Contact us, Privacy policy',
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SettingCard(
                color: BasicColor.deepBlack,
                callback: () {
                  print('subscriptions screen open');
                },
                isSubtile: false,
                title: 'My Subscription',
                icon: const Icon(
                  Icons.subscriptions,
                  size: 30,
                ),
                subtile: '',
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SettingCard(
                color: BasicColor.deepBlack,
                callback: () {
                  print('add account screen open');
                },
                isSubtile: false,
                title: 'Add account',
                icon: const Icon(
                  Icons.person_add_alt_1,
                  size: 30,
                ),
                subtile: '',
              ),
              SizedBox(
                height: height * 0.02,
              ),
              TextButton(
                onPressed: () {
                  print('invite a friend screen called');
                },
                child: Text(
                  'Invite a friend',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: BasicColor.deepBlack,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SettingCard(
                color: Colors.red,
                callback: () {
                  print('logout screen open');
                },
                isSubtile: false,
                title: 'Logout',
                icon: const Icon(
                  Icons.logout,
                  size: 30,
                  color: Colors.red,
                ),
                subtile: '',
              ),
              SizedBox(
                height: height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SettingCard extends StatelessWidget {
  SettingCard({
    super.key,
    required this.title,
    required this.icon,
    required this.subtile,
    required this.isSubtile,
    required this.callback,
    required this.color,
  });
  String title;
  String subtile;
  Icon icon;
  bool isSubtile;
  VoidCallback callback;
  Color color;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: callback,
      child: Container(
        height: height * 0.09,
        width: width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: BasicColor.deepWhite,
        ),
        child: ListTile(
          leading: icon,
          title: isSubtile
              ? Text(
                  title,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: color,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(top: width * 0.04),
                  child: Text(
                    title,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: color,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
          subtitle: Text(
            subtile,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                color: BasicColor.deepBlack,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
