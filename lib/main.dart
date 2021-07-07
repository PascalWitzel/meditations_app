import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditations_app/screens/menu_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: GoogleFonts.nunito(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 22,

          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
