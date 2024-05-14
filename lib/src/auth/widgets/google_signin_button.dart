import 'package:bookmywarehouse/widgets/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GooogleSignInButton extends StatefulWidget {
  const GooogleSignInButton({
    super.key,
    required this.btnText,
    required this.colors,
    required this.borderColors,
  });

  final String btnText;
  final Color colors, borderColors;

  @override
  // ignore: library_private_types_in_public_api
  _GooogleSignInButtonState createState() => _GooogleSignInButtonState();
}

class _GooogleSignInButtonState extends State<GooogleSignInButton> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool _isPressed = false;

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        final User? user = userCredential.user;

        if (user != null) {
          // Show circular loading indicator for 1/2 seconds
          showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          );

          // Delay the navigation to BottomNavBar
          await Future.delayed(const Duration(milliseconds: 2000));

          // Navigate to BottomNavBar
          Get.off(const BottomNavBar());

          print('Signed in with Google: ${user.displayName}');
        } else {
          print('Failed to sign in with Google');
        }
      }
    } catch (error) {
      // Handle sign-in errors
      print('Error signing in with Google: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        _signInWithGoogle();
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: height * 0.07,
        width: width * 0.9,
        decoration: BoxDecoration(
          color: _isPressed ? Colors.grey.withOpacity(0.5) : widget.colors,
          borderRadius: BorderRadius.circular(81),
          border: Border.all(
            width: 1,
            color:
                _isPressed ? Colors.grey.withOpacity(0.5) : widget.borderColors,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: width * 0.1,
              padding: const EdgeInsets.only(left: 15),
              child: Image.asset(
                'assets/images/Icon.png',
                height: 24,
                width: 24,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: width * 0.75,
              child: Center(
                child: Text(
                  widget.btnText,
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF475569),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
