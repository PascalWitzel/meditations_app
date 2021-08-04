import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:meditations_app/screens/settingsScreen.dart';
import 'package:meditations_app/screens/welcome_screen.dart';

import 'menu_home.dart';

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

AppBar appbarende(BuildContext context, String title) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
    ),
    leading: IconButton(
      icon: Icon(Icons.clear),
      onPressed: () async {
        if (await confirm(
          context,
          title: Text('Meditation beenden'),
          content: Text('Willst du die Meditation wirklich abbrechen?'),
          textOK: Text('Ja'),
          textCancel: Text('Nein'),
        )) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        }
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