import 'package:flutter/material.dart';
import 'package:meditations_app/screens/appbar.dart';

import 'confirm_screen.dart';
import 'menu_home.dart';

class MenuSound extends StatelessWidget {

  String title;

  MenuSound(String t) {
    this.title = t;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarback(context, title),
      body: Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(child: Text("Wähle den Sound zu deiner Meditation")),
                buildMenuCrate(Icons.timelapse, "Stumm", context, ConfirmScreen(title + " - " + "Stumm")),
                buildMenuCrate(Icons.timelapse, "Anleitung", context, ConfirmScreen(title + " - " + "Anleitung")),
                buildMenuCrate(Icons.timelapse, "Musik", context, ConfirmScreen(title + " - " + "Musik")),
              ],
            ),
          ]
      ),
    );
  }
}