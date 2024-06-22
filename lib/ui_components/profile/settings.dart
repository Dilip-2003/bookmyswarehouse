import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/profile/appbar.dart';
import 'package:bookmywarehouse/ui_components/profile/help.dart';
import 'package:bookmywarehouse/ui_components/profile/notifications_setting.dart';
import 'package:bookmywarehouse/ui_components/profile/personal_details.dart';
import 'package:bookmywarehouse/widgets/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _loggingOut = false;
  String? _userName;

  @override
  void initState() {
    super.initState();
    _getUserDisplayName();
  }

  Future<void> _getUserDisplayName() async {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _userName = user.displayName;
      });
    }
  }

  Future<void> signOut() async {
    setState(() {
      _loggingOut =
          true; // Set logging out to true to show the loading indicator
    });

    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
      print("User signed out successfully.");
      // Delay navigation to show the loading indicator for a short duration
      await Future.delayed(const Duration(seconds: 1));
      // Navigate to the onboarding screen after sign-out
      Get.off(() => const OnBoardingScreen());
    } catch (e) {
      print("Error signing out: $e");
      // Handle sign-out errors here, such as showing an error message to the user.
    } finally {
      setState(() {
        _loggingOut = false; // Set logging out to false after navigation
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                      _userName ?? '', // Display user name here
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationSettings(),
                    ),
                  );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpAndSupport(),
                    ),
                  );
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
                  Get.defaultDialog(
                    title: "Under Process",
                    middleText: "This page is under process",
                    textConfirm: "OK",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      Get.back();
                    },
                  );
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
                  Get.defaultDialog(
                    title: "Under Process",
                    middleText: "This page is under process",
                    textConfirm: "OK",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      Get.back();
                    },
                  );
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
                  Get.defaultDialog(
                    title: "Under Process",
                    middleText: "This page is under process",
                    textConfirm: "OK",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      Get.back();
                    },
                  );
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
              LogOutButton(),
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

class SettingCard extends StatelessWidget {
  const SettingCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.subtile,
    required this.isSubtile,
    required this.callback,
    required this.color,
  }) : super(key: key);

  final String title;
  final String subtile;
  final Icon icon;
  final bool isSubtile;
  final VoidCallback callback;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
