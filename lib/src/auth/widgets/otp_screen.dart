import 'package:bookmywarehouse/widgets/navigation_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    required this.userName,
    required this.icons,
    required this.emailText,
    required this.colors,
  });

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
  String enteredOtp = ''; // Track the entered OTP
  bool _verifying = false; // Track if verification process is ongoing

  late String _verificationId;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
    _otpController = OtpFieldController();
  }

  void sendOTP() async {
    String phoneNumber = _phoneNumberController.text.trim();
    if (phoneNumber.isEmpty) {
      _showSnackBar('Please enter a phone number');
    } else {
      setState(() {
        _verifying = true;
      });
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          _showSnackBar(
              'Phone number automatically verified and user signed in: ${FirebaseAuth.instance.currentUser?.uid}');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const BottomNavBar()),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          _showSnackBar('Failed to verify phone number: ${e.message}');
          setState(() {
            _verifying = false;
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _verificationId = verificationId;
            btnText = 'Resend OTP';
            _sendButtonActive = false;
            _otpFieldVisible = true;
            _verifying = false;
          });
          _showSnackBar('OTP sent. You can resend OTP after 30 seconds.');
          Future.delayed(const Duration(seconds: 30), () {
            setState(() {
              _sendButtonActive = true;
            });
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
      );
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void verifyOTP() async {
    if (enteredOtp.isEmpty) {
      _showSnackBar('Please enter OTP');
    } else {
      setState(() {
        _verifying = true;
      });
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId,
          smsCode: enteredOtp,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavBar()),
        );
      } catch (e) {
        _showSnackBar('Failed to sign in: $e');
        setState(() {
          _verifying = false;
        });
      }
    }
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
            color: const Color(0xFF1A1E25),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: width * 0.05),
        width: width,
        height: height * 0.4,
        child: _verifying
            ? const Center(
                child: SpinKitCircle(
                  color: Colors.blue,
                  size: 50.0,
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.userName,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1A1E25),
                      ),
                    ),
                  ),
                  IntlPhoneField(
                    controller: _phoneNumberController,
                    initialCountryCode: 'IN',
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      prefixIcon: widget.icons,
                      hintText: widget.emailText,
                      hintStyle: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(81),
                      ),
                    ),
                  ),
                  if (_otpFieldVisible)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'OTP',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1A1E25),
                            ),
                          ),
                        ),
                        OTPTextField(
                          controller: _otpController,
                          length: 6,
                          inputFormatter: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          width: MediaQuery.of(context).size.width,
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldWidth: 45,
                          fieldStyle: FieldStyle.box,
                          outlineBorderRadius: 15,
                          style: const TextStyle(fontSize: 17),
                          onChanged: (otp) {
                            setState(() {
                              enteredOtp = otp;
                            });
                          },
                          onCompleted: (otp) {
                            if (kDebugMode) {
                              print("Completed: $otp");
                            }
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.32,
                            vertical: height * 0.02,
                          ),
                          child: ElevatedButton(
                            onPressed: verifyOTP,
                            child: const Text("Verify"),
                          ),
                        ),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            btnText = 'Send OTP';
                            _otpController.clear();
                            _otpFieldVisible = false;
                          });
                        },
                        child: const Text('Clear'),
                      ),
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
