import 'package:flutter/material.dart';
import 'login_screen2.dart';

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
      backgroundColor: Color(0xffA8DDFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/logo.jpeg'),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Log in or Sign up in seconds',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Use your email or another service to continue with AirEasy (it\'s free)!',
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  button(
                      'Continue with Google',
                      isHoveringGoogle,
                      isPressingGoogle,
                      (value) => setState(() => isHoveringGoogle = value),
                      (value) => setState(() => isPressingGoogle = value),
                      onPress: () {
                    // Implement your Google sign in logic here
                  }),
                  SizedBox(height: 10),
                  button(
                      'Continue with Facebook',
                      isHoveringFacebook,
                      isPressingFacebook,
                      (value) => setState(() => isHoveringFacebook = value),
                      (value) => setState(() => isPressingFacebook = value),
                      onPress: () {
                    // Implement your Facebook sign in logic here
                  }),
                  SizedBox(height: 10),
                  button(
                      'Continue with Email',
                      isHoveringEmail,
                      isPressingEmail,
                      (value) => setState(() => isHoveringEmail = value),
                      (value) => setState(() => isPressingEmail = value),
                      onPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen2()),
                    );
                  }),
                  SizedBox(height: 20),
                  Text.rich(
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
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      // Implement your logic to open the role selection screen here
                    },
                    child: Text('Don\'t have an account? Sign Up'),
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
    String text,
    bool isHovering,
    bool isPressing,
    void Function(bool) onHovering,
    void Function(bool) onPressing, {
    void Function()? onPress,
  }) {
    return MouseRegion(
      onEnter: (_) => onHovering(true),
      onExit: (_) => onHovering(false),
      child: GestureDetector(
        onTapDown: (_) => onPressing(true),
        onTapUp: (_) => onPressing(false),
        onTapCancel: () => onPressing(false),
        child: MaterialButton(
          color:
              isHovering || isPressing ? Color(0xFF3A75C4) : Color(0xFFFEF9ED),
          onPressed: onPress,
          child: Text(
            text,
            style: TextStyle(
                color: isHovering || isPressing ? Colors.white : Colors.black),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
