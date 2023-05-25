import 'package:flutter/material.dart';
import '../login/signup_screen.dart';
import '../flight_attendant/flight_attendant_login_screen.dart';

class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffA8DDFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/logo.jpeg'),
                ),
                const SizedBox(height: 20), // Decreased from 30
                const Text(
                  'Welcome to AirEasy',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20), // Decreased from 30
                const Text(
                  'Please select your role:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 130,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the roundness here
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Passenger', style: TextStyle(fontSize: 26)),
                        const SizedBox(height: 10),
                        Image.asset(
                          'assets/passenger.jpeg',
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40), // Increased from 20
                SizedBox(
                  width: double.infinity,
                  height: 130,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the roundness here
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const FlightAttendantLoginScreen(),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Flight Attendant',
                            style: TextStyle(fontSize: 26)),
                        const SizedBox(height: 10),
                        Image.asset(
                          'assets/flight_attendant.jpeg',
                          height: 40,
                        ),
                      ],
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
