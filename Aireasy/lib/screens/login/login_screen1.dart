import 'package:flutter/material.dart';
import 'login_screen2.dart';
import '../role_selection/role_selection_screen.dart';
import 'package:flutter/gestures.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({Key? key}) : super(key: key);

  @override
  _LoginScreen1State createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  bool isHoveringGoogle = false;
  bool isPressingGoogle = false;
  bool isHoveringFacebook = false;
  bool isPressingFacebook = false;
  bool isHoveringEmail = false;
  bool isPressingEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffA8DDFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/logo.jpeg'),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Log in or Sign up in seconds',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Use your email or another service to continue with AirEasy (it\'s free)!',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  button(
                    'assets/google_logo.png',
                    'Log In with Google',
                    isHoveringGoogle,
                    isPressingGoogle,
                    (value) => setState(() => isHoveringGoogle = value),
                    (value) => setState(() => isPressingGoogle = value),
                    const Color(0xFFFFFFFF), // Google button color
                    const Color(0xFF000000), // Google text color
                    onPress: () {
                      // Implement your Google sign in logic here
                    },
                  ),
                  const SizedBox(height: 10),
                  button(
                    'assets/facebook_logo.png',
                    'Log In with Facebook',
                    isHoveringFacebook,
                    isPressingFacebook,
                    (value) => setState(() => isHoveringFacebook = value),
                    (value) => setState(() => isPressingFacebook = value),
                    const Color(0xFF1877F2), // Facebook button color
                    const Color(0xFFFFFFFF), // Facebook text color
                    onPress: () {
                      // Implement your Facebook sign in logic here
                    },
                  ),
                  const SizedBox(height: 10),
                  button(
                    null,
                    'Log In with Email',
                    isHoveringEmail,
                    isPressingEmail,
                    (value) => setState(() => isHoveringEmail = value),
                    (value) => setState(() => isPressingEmail = value),
                    const Color(0xFF000000), // Email button color
                    const Color(0xFFFFFFFF), // Email text color
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen2(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 18),
                  const Text.rich(
                    TextSpan(
                      text: 'By continuing, you agree to AirEasy\'s ',
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms of Use',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                        TextSpan(text: '. Read our '),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 22),
                  RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SelectRoleScreen(),
                                ),
                              );
                            },
                          text: 'Sign Up',
                          style: const TextStyle(
                            color: Color(0xff053677),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget button(
    String? logoPath,
    String text,
    bool isHovering,
    bool isPressing,
    void Function(bool) onHovering,
    void Function(bool) onPressing,
    Color buttonColor,
    Color textColor, {
    void Function()? onPress,
  }) {
    return MouseRegion(
      onEnter: (_) => onHovering(true),
      onExit: (_) => onHovering(false),
      child: GestureDetector(
        onTapDown: (_) => onPressing(true),
        onTapUp: (_) => onPressing(false),
        onTapCancel: () => onPressing(false),
        child: Container(
          width: 345, // Set width
          height: 54, // Set height
          child: MaterialButton(
            color: buttonColor,
            onPressed: onPress,
            padding: const EdgeInsets.all(15), // Set padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Set border radius
            ),
            child: Row(
              children: [
                if (logoPath != null)
                  Image.asset(logoPath,
                      height: 22.86, width: 23), // Adjust logo size
                if (logoPath == null)
                  SizedBox(width: 23), // Add empty space for Email button
                const SizedBox(
                    width: 15), // Add a space between the logo and text
                Flexible(
                  // To avoid overflow if text is longer
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: 'Roboto', // Use Roboto font
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
