import 'package:bookmywarehouse/ui_components/login_signup_page/welcome.dart';
import 'package:bookmywarehouse/widgets/navigation_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    Key? key,
    required this.userName,
    required this.icons,
    required this.emailText,
    required this.colors,
  }) : super(key: key);

  final String emailText, userName;
  final Icon icons;
  final Color colors;

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late TextEditingController _phoneNumberController;
  late OtpFieldController _otpController;
  String btnText = 'Send OTP';
  bool _sendButtonActive = true;
  bool _otpFieldVisible = false; // Track the visibility of the OTP field

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
    _otpController = OtpFieldController();
  }

  void sendOTP() {
    // Code to send OTP to the provided email or phone number
    print('OTP sent to: ${_phoneNumberController.text}');
    setState(() {
      btnText = 'Resend OTP';
      _sendButtonActive = !_sendButtonActive;
      _otpFieldVisible = true; // Show the OTP field after sending OTP
      _showSnackBar('OTP sent. You can resend OTP after 30 seconds.');
    });
    // Start a timer to activate resend button after 30 seconds
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        _sendButtonActive = !_sendButtonActive;
      });
    });
  }

  // void resendOTP() {
  //   // Code to resend OTP to the provided email or phone number
  //   print('Resending OTP to: ${_phoneNumberController.text}');
  //   setState(() {
  //     _resendButtonActive = !_resendButtonActive;
  //   });
  //   // Start a timer to activate resend button after 30 seconds
  //   Future.delayed(const Duration(seconds: 10), () {
  //     setState(() {
  //       _resendButtonActive = !_resendButtonActive;
  //     });
  //   });
  //   _showSnackBar('OTP resent. You can resend OTP again after 30 seconds.');
  // }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_arrow_left,
            size: width * 0.1,
            weight: 1.0,
            color: const Color(0xFF1A1E25),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: width * 0.05,
          right: width * 0.05,
        ),
        width: width,
        height: height * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const WelcomeColum(
              text1: 'Welcome!',
              text2: 'Log In to your account to explore your dream Warehouse !',
            ),
            SizedBox(height: height * 0.05),
            Text(
              widget.userName,
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.02,
                  color: Color(0xFF1A1E25),
                ),
              ),
            ),
            Container(
              width: width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(81),
                color: widget.colors,
              ),
              height: height * 0.06,
              child: TextField(
                controller: _phoneNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: widget.icons,
                  hintText: widget.emailText,
                  hintStyle: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.02,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(81),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            if (_otpFieldVisible) // Display OTP field only if visible
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'OTP',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.02,
                            color: Color(0xFF1A1E25),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OTPTextField(
                    controller: _otpController,
                    length: 5,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 45,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 15,
                    style: const TextStyle(fontSize: 17),
                    onChanged: (pin) {
                      if (kDebugMode) {
                        print("Changed: " + pin);
                      }
                    },
                    onCompleted: (pin) {
                      if (kDebugMode) {
                        print("Completed: $pin");
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('verified number');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNavBar(),
                          ));
                      // Navigate to next screen or perform action after OTP verification
                    },
                    child: const Text("Verify"),
                  ),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print("Floating button was pressed.");
                    btnText = 'Send OTP';
                    _otpController.clear();
                    setState(() {
                      // _sendButtonActive = !_sendButtonActive;
                      _otpFieldVisible = false; // Hide the OTP field
                    });
                  },
                  child: const Text('Clear'),
                ),
                // ElevatedButton(
                //   onPressed: _resendButtonActive ? resendOTP : null,
                //   child: const Text('Resend OTP'),
                // ),
                ElevatedButton(
                  onPressed: _sendButtonActive ? sendOTP : null,
                  child: Text(btnText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
