import 'package:flutter/material.dart';
import 'package:meditations_app/screens/settingsScreen.dart';
import 'package:meditations_app/screens/welcome_screen.dart';

AppBar appbarhome(BuildContext context, String title) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
    ),
    leading: GestureDetector(
      child: Icon(Icons.house),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => WelcomeScreen()));
      }
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: GestureDetector(
          child: Icon(Icons.settings),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => settingsScreen()));
          },
        ),
      )
    ],
  );
}

AppBar appbarback(BuildContext context, String title) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
    ),
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(
            context
        );
      },
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: GestureDetector(
          child: Icon(Icons.settings),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => settingsScreen()));
          },
        ),
      )
    ],
  );
}