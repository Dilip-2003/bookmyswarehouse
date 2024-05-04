import 'package:bookmywarehouse/constants/color/base_color.dart';
import 'package:bookmywarehouse/src/auth/widgets/login_button.dart';
import 'package:bookmywarehouse/src/auth/pages/login_screen.dart';
import 'package:bookmywarehouse/src/auth/pages/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: height * 0.05,
                    left: width * 0.015,
                    right: width * 0.015),
                height: height * 0.6,
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/firstcolumn.png',
                        height: height * 0.6,
                        width: width * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/secondcolumn.png',
                        height: height * 0.6,
                        width: width * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/thirdcolumn.png',
                        height: height * 0.6,
                        width: width * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: height * 0.45,
            child: SizedBox(
              height: height * 0.65,
              child: Column(
                children: [
                  Container(
                    height: height * 0.1,
                    width: width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            const Color(0xFFFBFBFB).withOpacity(0.2),
                            const Color(0xFFBFBFBF).withOpacity(0.8),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.015),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    height: height * 0.45,
                    width: width,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: height * 0.015),
                          child: Text(
                            'Warehouse on your ',
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1A1E25),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Fingertips',
                          style: GoogleFonts.plusJakartaSans(
                            textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1A1E25),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Are you ready to uproot and start over in a new area? Placoo will help you on your journey!',
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF7D7F88),
                                letterSpacing: 0.02,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        LoginButton(
                          btnText: 'Login',
                          color: BasicColor.primary,
                          borderColor: BasicColor.primary,
                          textColor: const Color(0xFFFFFFFF),
                          callback: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreens(),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        LoginButton(
                          btnText: 'Sign Up',
                          color: const Color(0xFFFFFFFF),
                          borderColor: const Color(0xFFE3E3E7),
                          textColor: const Color(0xFF475569),
                          callback: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreens(),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
