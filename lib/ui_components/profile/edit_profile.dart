import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/profile/appbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_profile_avatar/user_profile_avatar.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController1 = TextEditingController();
    TextEditingController addressController2 = TextEditingController();
    TextEditingController addressController3 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const ProfileAppBar(
          text: 'Edit Profile',
        ),
      ),
      backgroundColor: const Color(0xFFF3F3F3),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            children: [
              Container(
                height: height * 0.35,
                width: width * 0.9,
                margin: EdgeInsets.only(top: height * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: BasicColor.deepWhite,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.01),
                      child: UserProfileAvatar(
                        avatarUrl: '',
                        radius: 40,
                        onAvatarTap: () {},
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomTextField(
                      icon: const Icon(
                        FontAwesomeIcons.user,
                        size: 16,
                      ),
                      controller: nameController,
                      keyboardinput: TextInputType.text,
                      text: 'Dilip Sarkar',
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomTextField(
                      icon: const Icon(
                        Icons.call,
                        size: 16,
                      ),
                      controller: phoneController,
                      keyboardinput: TextInputType.number,
                      text: '+919064364294',
                    ),
                  ],
                ),
              ),
              Container(
                height: height * 0.35,
                width: width * 0.9,
                margin: EdgeInsets.only(top: height * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: BasicColor.deepWhite,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: width * 0.05, left: width * 0.05),
                      child: const CustomLabel(
                        labeltext: 'Address',
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomTextField(
                      icon: const Icon(
                        Icons.house,
                        size: 25,
                      ),
                      controller: addressController1,
                      keyboardinput: TextInputType.text,
                      text: '111, ABC Apartments',
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomTextField(
                      icon: const Icon(
                        Icons.house,
                        size: 25,
                      ),
                      controller: addressController2,
                      keyboardinput: TextInputType.text,
                      text: 'XYZ Road, New Delhi',
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomTextField(
                      icon: const Icon(
                        Icons.house,
                        size: 25,
                      ),
                      controller: addressController3,
                      keyboardinput: TextInputType.text,
                      text: 'Delhi',
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              CustomButton(
                btnText: 'Save',
                callback: () {
                  if (kDebugMode) {
                    print(nameController.text.toString());
                  }
                  if (kDebugMode) {
                    print(phoneController.text.toString());
                  }
                  if (kDebugMode) {
                    print(addressController1.text.toString());
                  }
                  if (kDebugMode) {
                    print(addressController2.text.toString());
                  }
                  if (kDebugMode) {
                    print(addressController3.text.toString());
                  }
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  CustomButton({super.key, required this.btnText, required this.callback});
  final String btnText;
  VoidCallback callback;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return ElevatedButton(
      onPressed: widget.callback,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
          return BasicColor.primary;
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: SizedBox(
        height: height * 0.07,
        width: width * 0.9,
        child: Center(
          child: Text(
            widget.btnText,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                color: BasicColor.deepWhite,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomLabel extends StatelessWidget {
  const CustomLabel({super.key, required this.labeltext});
  final String labeltext;
  @override
  Widget build(BuildContext context) {
    return Text(
      labeltext,
      style: GoogleFonts.inter(
          textStyle: const TextStyle(
        color: Color(0xFF444444),
        fontSize: 18,
        fontWeight: FontWeight.w400,
      )),
    );
  }
}

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.controller,
    required this.text,
    required this.icon,
    required this.keyboardinput,
  });
  TextEditingController controller;
  final String text;
  final Icon icon;
  TextInputType keyboardinput;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: SizedBox(
        height: height * 0.065,
        child: TextField(
          controller: controller,
          keyboardType: keyboardinput,
          decoration: InputDecoration(
            prefixIcon: icon,
            hintText: text,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
    );
  }
}
