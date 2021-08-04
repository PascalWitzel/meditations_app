import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ----  Text Theme  ----
final lightTextTheme = TextTheme(
  headline1: GoogleFonts.nunito(
  color: Colors.white,
  fontWeight: FontWeight.w600,
  fontSize: 22,
  )
);

/// ----  Text Theme  ----
final darkTextTheme = TextTheme(
    headline1: GoogleFonts.nunito(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 22,
    )
);

/// ----  Blue Theme  ----
final blueTheme = ThemeData(
  primarySwatch: Colors.blue,
  accentColor: Color(0xFF9FCCF8),
  textTheme: lightTextTheme,
);

/// ----  Orange Theme  ----
final orangeTheme = ThemeData(
  primarySwatch: Colors.orange,
  accentColor: Color(0xFFF8BB67),
  textTheme: darkTextTheme,
);

/// ----  Green Theme  ----
final greenTheme = ThemeData(
  primarySwatch: Colors.lightGreen,
  accentColor: Color(0xFF54930C),
  textTheme: darkTextTheme,
);

/// ----  Purple Theme  ----
final purpleTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  accentColor: Color(0xFFA530BA),
  textTheme: lightTextTheme,
);