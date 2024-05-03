import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/ui_components/profile/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:switcher_button/switcher_button.dart';

class NotificationSettings extends StatefulWidget {
  const NotificationSettings({super.key});

  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      appBar: AppBar(
        title: const ProfileAppBar(text: 'Nofications Settings'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.03,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NotificationsRow(text: 'Enable Notifications'),
              SizedBox(
                height: height * 0.07,
              ),
              Text(
                'Notification Preferences',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: BasicColor.deepBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              const NotificationsRow(
                  text: 'Receive notifications for new messages'),
              SizedBox(
                height: height * 0.01,
              ),
              const NotificationsRow(
                  text: 'Receive notifications for friend requests'),
              SizedBox(
                height: height * 0.01,
              ),
              const NotificationsRow(
                  text: 'Receive notifications for updates in communities'),
              SizedBox(
                height: height * 0.01,
              ),
              const NotificationsRow(
                  text: 'Receive notifications for upcoming events'),
              SizedBox(
                height: height * 0.01,
              ),
              const NotificationsRow(
                  text: 'Receive notifications for new followers'),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationsRow extends StatelessWidget {
  const NotificationsRow({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.6,
          child: Text(
            text,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                color: BasicColor.deepBlack,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        SwitcherButton(
          onColor: BasicColor.primary,
          offColor: Colors.white,
          size: 50,
          onChange: (value) {
            print('some operations is performed');
          },
        ),
      ],
    );
  }
}
