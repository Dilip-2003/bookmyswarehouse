import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/profile/appbar.dart';
import 'package:bookmywarehouse/ui_components/profile/edit_profile.dart';
import 'package:bookmywarehouse/widgets/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({Key? key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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

class DeleteButton extends StatefulWidget {
  const DeleteButton({Key? key});

  @override
  State<DeleteButton> createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        if (kDebugMode) {
          print('delete button pressed');
        }
        // Add functionality for deleting the account here
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

class LogOutButton extends StatefulWidget {
  const LogOutButton({Key? key});

  @override
  State<LogOutButton> createState() => _LogOutButtonState();
}

class _LogOutButtonState extends State<LogOutButton> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _loggingOut = false;

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
      await Future.delayed(const Duration(seconds: 2));
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
    return InkWell(
      onTap: () {
        if (kDebugMode) {
          print('logout button pressed');
        }
        signOut();
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
              child: _loggingOut
                  ? const Center(
                      child:
                          CircularProgressIndicator()) // Show loading indicator when logging out
                  : const Icon(
                      Icons.logout,
                      color: Colors.red,
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
                    onPressed: () {
                      if (!_loggingOut) {
                        signOut();
                      }
                    },
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
  const SectionFour({Key? key});

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
                  builder: (context) => const EditProfile(),
                ),
              );
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
  CustomCard({Key? key, required this.icons, required this.text});
  final IconButton icons;
  final String text;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
  const BusinessDetails({Key? key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
  const TextBox({Key? key, required this.text1, required this.text2});
  final String text1, text2;

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.of(context).size.width;
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
  const PersonContacts({Key? key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return FutureBuilder<String>(
      future: displayName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the future to complete, you can return a loading indicator
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // If an error occurs, handle it appropriately
          return Text('Error: ${snapshot.error}');
        } else {
          // If the future completes successfully, display the user's name
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
                  'Hi, ${snapshot.data}', // Display the user's name obtained from the future
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Color(0xFF222222),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
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
      },
    );
  }

  Future<String> displayName() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    final userName = currentUser?.displayName ?? 'User';
    print(userName);
    return userName;
  }
}
