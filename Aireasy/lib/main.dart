import 'package:flutter/material.dart';
import 'screens/login/login_screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AirEasy',
      theme: ThemeData(
        primaryColor: const Color(0xFF3A75C4),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF3A75C4),
          secondary: Color(0xFFA8DDFF),
          onPrimary: Color(0xFFFFFFFF),
          surface: Color(0xFFFEF9ED),
          background: Color(0xFFA8DDFF),
          onBackground: Color(0xFF000000),
        ),
        scaffoldBackgroundColor: const Color(0xFFA8DDFF),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Roboto', // Use Roboto font
            color: Color(0xFF000000),
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Roboto', // Use Roboto font
            color: Color(0xFF000000),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      home: const LoginScreen1(),
    );
  }
}
