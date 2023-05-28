import 'package:flutter/material.dart';
import '../login/signup_screen.dart';

class PassengerMainMenuScreen extends StatefulWidget {
  const PassengerMainMenuScreen({Key? key}) : super(key: key);

  @override
  _PassengerMainMenuScreenState createState() =>
      _PassengerMainMenuScreenState();
}

class _PassengerMainMenuScreenState extends State<PassengerMainMenuScreen> {
  bool _hasPNR = false;

  @override
  void initState() {
    super.initState();
    _checkPNR();
  }

  Future<void> _checkPNR() async {
    // Check PNR here (placeholder code, not implemented)
    // If there's a valid PNR, set _hasPNR to true
    _hasPNR = true; // For simplicity, we assume that the PNR is valid
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Passenger Main Menu"),
      ),
      body: _hasPNR
          ? Center(
              child: Text("Welcome! Feel free to explore."),
            )
          : Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                ),
                child: Text('Enter PNR to Proceed'),
              ),
            ),
    );
  }
}
