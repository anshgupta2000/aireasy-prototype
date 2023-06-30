import 'package:flutter/material.dart';
import './user_profile_screen.dart';
import './passenger_list_screen.dart';
import './in_flight_services_screen.dart';

class PassengerMainMenuScreen extends StatefulWidget {
  const PassengerMainMenuScreen({Key? key}) : super(key: key);

  @override
  _PassengerMainMenuScreenState createState() =>
      _PassengerMainMenuScreenState();
}

class _PassengerMainMenuScreenState extends State<PassengerMainMenuScreen> {
  bool _hasPNR = false; // make sure to set this based on PNR check

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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30, // Adjusted to fit in AppBar
              backgroundImage: AssetImage('assets/logo.jpeg'),
            ),
            SizedBox(width: 10),
            Text(
              'AirEasy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const CircleAvatar(
            backgroundImage: AssetImage(
                'assets/blank_profile.png'), // replace with user profile picture if exists
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    UserProfileScreen()), // Removed 'const' here
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              SizedBox(
                width: double.infinity,
                height: 130,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _hasPNR
                      ? () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const PassengerListScreen()),
                          )
                      : null, // disable button if no PNR
                  child: const Text(
                    'Chat with Passengers',
                    style: TextStyle(fontSize: 26),
                  ),
                ),
              ),
              const SizedBox(height: 100),
              SizedBox(
                width: double.infinity,
                height: 130,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _hasPNR
                      ? () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const InFlightServicesScreen()),
                          )
                      : null, // disable button if no PNR
                  child: const Text(
                    'Request Drinks, Snacks or Assistance',
                    style: TextStyle(fontSize: 26),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
